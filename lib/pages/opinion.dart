import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  Map<String, dynamic> questions = {};
  Map<String, int> feedbackValues = {};
  String userId = '';

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/json/questions.json');
    final data = await json.decode(response);
    setState(() {
      questions = data;
      questions.forEach((section, questionList) {
        for (var question in questionList) {
          feedbackValues[question['titulo']] = question['valor'];
        }
      });
    });
  }

  void submitFeedback() async {
    String feedbackContent = 'ID de usuario: $userId\n\n';
    questions.forEach((section, questionList) {
      feedbackContent += '$section:\n';
      for (var question in questionList) {
        String title = question['titulo'];
        int rating = feedbackValues[title] ?? 0;
        feedbackContent += '$title - Calificación: $rating estrellas\n';
      }
      feedbackContent += '\n';
    });

    final Email email = Email(
      body: feedbackContent,
      subject: 'Retroalimentación de la App',
      recipients: ['diegomoralesv11@gmail.com'],
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Retroalimentación enviada exitosamente!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar la retroalimentación')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tu Opinión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            TextField(
              decoration: InputDecoration(labelText: 'ID de usuario'),
              onChanged: (value) {
                setState(() {
                  userId = value;
                });
              },
            ),
            */
            Expanded(
              child: ListView(
                children: questions.entries.map((entry) {
                  String section = entry.key;
                  List questionList = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ...questionList.map((question) {
                        String title = question['titulo'];
                        String minDesc = question['min'];
                        String maxDesc = question['max'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            title,
                              style: TextStyle(
                              fontSize: 18, // Cambia este valor al tamaño que prefieras
                              fontWeight: FontWeight.bold, // Opcional: para hacer el texto en negrita
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: 5,
                              divisions: 5,
                              label: '${feedbackValues[title]} estrellas',
                              value: feedbackValues[title]?.toDouble() ?? 0,
                              onChanged: (value) {
                                setState(() {
                                  feedbackValues[title] = value.toInt();
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            Text('$minDesc'),
                            SizedBox(height: 10),
                            Text('$maxDesc'),
                            SizedBox(height: 10),
                          ],
                        );
                      }).toList(),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: submitFeedback,
              child: Text('Enviar retroalimentación'),
            ),
          ],
        ),
      ),
    );
  }
}