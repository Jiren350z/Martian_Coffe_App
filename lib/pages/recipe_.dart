import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';


class RecipeListWidget extends StatelessWidget {
  final List<RecipeNew> recipes;

  const RecipeListWidget({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Recetas')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(
              recipe.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navegar a la página de detalles cuando se haga clic en una receta
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}