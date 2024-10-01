import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/pages/ingredient_detail_page.dart';

class IngredientListWidget extends StatelessWidget {
  final List<IngredientNew> ingredients;

  const IngredientListWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredientes Favoritos')),
      body: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,

            child: InkWell(

               onTap: () {
                // navegar a la pagina de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientWidget(ingredient: ingredient),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ingredient.imageOfIngredient,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ingredient.type,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < ingredient.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    const SizedBox(height: 5),
                    Text('Ubicación: ${ingredient.ubication}'),
                  ],
                ), 
              ),
            ),
          );
        },
      ),
    );
  }
}