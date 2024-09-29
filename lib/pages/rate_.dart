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

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating.toDouble(); // Inicializamos con la calificación inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calificar ${widget.recipeName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selecciona tu calificación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < _currentRating ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
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
                // Aquí podrías guardar la calificación y regresar a la página anterior
                Navigator.pop(context, _currentRating.toInt()); // Regresar la calificación
              },
              child: const Text('Enviar Calificación'),
            ),
          ],
        ),
      ),
    );
  }
}

