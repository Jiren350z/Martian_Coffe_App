import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecipeNew recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar ingredientes
            const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.ingredients.map((ingredient) {
                return Text(
                  '- ${ingredient.type} (${ingredient.value} unidades)',
                  style: const TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            // Mostrar utensilios
            const Text('Utensilios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.utensils.map((utensil) {
                return Text('- $utensil', style: const TextStyle(fontSize: 16));
              }).toList(),
            ),
            const SizedBox(height: 10),
            // Mostrar el creador de la receta
            Text(
              'Creador: ${recipe.userCreator.name}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}