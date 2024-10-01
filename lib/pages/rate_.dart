import 'package:flutter/material.dart';



class RatingPage extends StatefulWidget {
  final int initialRating;
  final String recipeName;
  final String category; // Nueva variable para la categoría

  const RatingPage({
    super.key,
    required this.initialRating,
    required this.recipeName,
    required this.category, // Aceptamos la categoría como parámetro
  });

  @override
  RatingPageState createState() => RatingPageState();
}

class RatingPageState extends State<RatingPage> {
  double _rating = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating.toDouble();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSection(
              title: 'Calificación de ${widget.category.toLowerCase()}', // Usamos la categoría en el título
              currentRating: _rating,
              onRatingChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
              commentController: commentController,
            ),
            const SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar el envío de la calificación
                Navigator.pop(context, _rating.toInt());
              },
              child: const Text('Enviar Calificación'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required double currentRating,
    required ValueChanged<double> onRatingChanged,
    required TextEditingController commentController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < currentRating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 40,
            );
          }),
        ),
        Slider(
          value: currentRating,
          min: 0,
          max: 5,
          divisions: 5,
          onChanged: onRatingChanged,
        ),
        Text(
          'Valoración: ${currentRating.toInt()}/5',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Añade un comentario...',
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Implementar lógica de envío de comentarios
              },
            ),
          ),
        ),
      ],
    );
  }
}

/*
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
  double _recipeRating = 0;
  double _ingredientRating = 0;
  double _productRating = 0;
  double _methodRating = 0;

  final TextEditingController recipeComment = TextEditingController();
  final TextEditingController ingredientComment = TextEditingController();
  final TextEditingController productComment = TextEditingController();
  final TextEditingController methodComment = TextEditingController();

  String _selectedCategory = 'Receta'; // Variable para almacenar la categoría seleccionada

  @override
  void initState() {
    super.initState();
    _recipeRating = widget.initialRating.toDouble();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>['Receta', 'Ingredientes', 'Producto', 'Método de preparación']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (_selectedCategory == 'Receta')
              _buildSection(
                title: 'Calificación de la receta',
                currentRating: _recipeRating,
                onRatingChanged: (newRating) {
                  setState(() {
                    _recipeRating = newRating;
                  });
                },
                commentController: recipeComment,
              ),
            if (_selectedCategory == 'Ingredientes')
              _buildSection(
                title: 'Calificación de los ingredientes',
                currentRating: _ingredientRating,
                onRatingChanged: (newRating) {
                  setState(() {
                    _ingredientRating = newRating;
                  });
                },
                commentController: ingredientComment,
              ),
            if (_selectedCategory == 'Producto')
              _buildSection(
                title: 'Calificación del producto',
                currentRating: _productRating,
                onRatingChanged: (newRating) {
                  setState(() {
                    _productRating = newRating;
                  });
                },
                commentController: productComment,
              ),
            if (_selectedCategory == 'Método de preparación')
              _buildSection(
                title: 'Calificación del método de preparación',
                currentRating: _methodRating,
                onRatingChanged: (newRating) {
                  setState(() {
                    _methodRating = newRating;
                  });
                },
                commentController: methodComment,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar el envío de la calificación según la categoría seleccionada
                Navigator.pop(context, _recipeRating.toInt());
              },
              child: const Text('Enviar Calificación'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required double currentRating,
    required ValueChanged<double> onRatingChanged,
    required TextEditingController commentController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < currentRating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 40,
            );
          }),
        ),
        Slider(
          value: currentRating,
          min: 0,
          max: 5,
          divisions: 5,
          onChanged: onRatingChanged,
        ),
        Text(
          'Valoración: ${currentRating.toInt()}/5',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Añade un comentario...',
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Implementar lógica de envío de comentarios
              },
            ),
          ),
        ),
      ],
    );
  }
}
*/

/*
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
  double _recipeRating = 0;
  double _ingredientRating = 0;
  double _productRating = 0;
  double _methodRating = 0;

  final TextEditingController recipeComment = TextEditingController();
  final TextEditingController ingredientComment = TextEditingController();
  final TextEditingController productComment = TextEditingController();
  final TextEditingController methodComment = TextEditingController();

  @override
  void initState() {
    super.initState();
    _recipeRating = widget.initialRating.toDouble();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Calificación de la receta',
              currentRating: _recipeRating,
              onRatingChanged: (newRating) {
                setState(() {
                  _recipeRating = newRating;
                });
              },
              commentController: recipeComment,
            ),
            _buildSection(
              title: 'Calificación de los ingredientes',
              currentRating: _ingredientRating,
              onRatingChanged: (newRating) {
                setState(() {
                  _ingredientRating = newRating;
                });
              },
              commentController: ingredientComment,
            ),
            _buildSection(
              title: 'Calificación del producto',
              currentRating: _productRating,
              onRatingChanged: (newRating) {
                setState(() {
                  _productRating = newRating;
                });
              },
              commentController: productComment,
            ),
            _buildSection(
              title: 'Calificación del método de preparación',
              currentRating: _methodRating,
              onRatingChanged: (newRating) {
                setState(() {
                  _methodRating = newRating;
                });
              },
              commentController: methodComment,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.pop(context, _recipeRating.toInt());
              },
              child: const Text('Enviar Calificación'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required double currentRating,
    required ValueChanged<double> onRatingChanged,
    required TextEditingController commentController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < currentRating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 40,
            );
          }),
        ),
        Slider(
          value: currentRating,
          min: 0,
          max: 5,
          divisions: 5,
          onChanged: onRatingChanged,
        ),
        Text(
          'Valoración: ${currentRating.toInt()}/5',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Añade un comentario...',
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Implementar lógica de envío de comentarios
              },
            ),
          ),
        ),
      ],
    );
  }


}
*/
/*
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
*/
