import 'package:flutter/material.dart';


class RatingPage extends StatefulWidget {
  final int initialRating;
  final String recipeName;

  const RatingPage({
    super.key,
    required this.initialRating,
    required this.recipeName,
  });

  @override
  RatingPageState createState() => RatingPageState();
}

class RatingPageState extends State<RatingPage> {
  
  double _currentRating = 0;

  final TextEditingController comment = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating.toDouble(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calificar ${widget.recipeName}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 90),
            const Text(
              'Selecciona tu calificación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < _currentRating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                );
              }),
            ),
            const SizedBox(height: 10),
            Slider(
              value: _currentRating,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (newRating) {
                setState(() {
                  _currentRating = newRating;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Valoración: ${_currentRating.toInt()}/5',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.pop(context, _currentRating.toInt()); 
              },
              child: const Text('Enviar Calificación'),
            ),
            const SizedBox(height: 350),
            TextField(
              controller: comment,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], 
                hintText: 'Comparte tu evaluación de café...',
                hintStyle: TextStyle(color: Colors.grey[600]), 
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide.none, 
                ),

                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                  onPressed: () {

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

