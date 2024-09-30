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
    _currentRating = widget.initialRating.toDouble(); // Inicializamos con la calificación inicial
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
            const SizedBox(height: 350),
            TextField(
              controller: comment,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Fondo claro
                hintText: 'Comparte tu evaluación de café...',
                hintStyle: TextStyle(color: Colors.grey[600]), // Estilo del hint
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Espaciado interno
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin bordes visibles
                ),
                //prefixIcon: Icon(Icons.send, color: Colors.grey[600]), // Icono de emoji
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor), // Icono de enviar
                  onPressed: () {
                    // Funcionalidad para enviar el comentario
                    //print('Comentario enviado: ${comment.text}');
                    //comment.clear(); // Limpiar el campo de texto después de enviar
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

