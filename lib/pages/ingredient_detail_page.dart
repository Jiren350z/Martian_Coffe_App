import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/pages/rate_.dart';

class IngredientWidget extends StatefulWidget {
  final IngredientNew ingredient;

  const IngredientWidget({super.key, required this.ingredient});

  @override
  IngredientWidgetState createState() => IngredientWidgetState();
}

class IngredientWidgetState extends State<IngredientWidget> {
  bool isFavorite = false; // Estado de favorito
  int userRating = 0; // Estado de la calificación del usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ingredient.type),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del ingrediente
              Image.asset(
                widget.ingredient.imageOfIngredient,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
              const SizedBox(height: 5),
              
              // Filas para rating y botones
              Row(
                children: [
                  // Estrellas de calificación
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < widget.ingredient.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  
                  // Botón de favorito
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  
                  // Botón de compartir
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.grey),
                    onPressed: () {
                      // Lógica para compartir
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingPage(
                        initialRating: userRating,
                        recipeName: widget.ingredient.type,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      userRating = result;
                    });
                  }
                },
                child: const Text('Calificar'),
              ),              

              const Text(
                'Detalles del Ingrediente:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
              Text(
                'Tipo: ${widget.ingredient.type}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              
              Text(
                'Precio: ${widget.ingredient.value.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              
              Text(
                'Ubicación: ${widget.ingredient.ubication}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              
              // Botón de buscar ubicación
              ElevatedButton(
                onPressed: () {
                  widget.ingredient.lookUbication();
                },
                child: const Text('Buscar Ubicación'),
              ),
              
              const SizedBox(height: 200),

              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Escribe un comentario...',
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
      ),
    );
  }
}

