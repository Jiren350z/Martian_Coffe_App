import 'dart:io';
import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
//import 'package:martian_cofee_app/pages/product_detail_page.dart';
import 'package:martian_cofee_app/pages/add_recipe.dart';
import 'package:martian_cofee_app/utils/datebase_helper.dart';

class MyRecipesWidget extends StatefulWidget {

  const MyRecipesWidget({super.key});

  @override
  _MyRecipesWidgetState createState() => _MyRecipesWidgetState();
}

class _MyRecipesWidgetState extends State<MyRecipesWidget> {
  List<RecipeNew> recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

void _loadRecipes() async {
    
  final dbHelper = DatabaseHelper();
  final loadedRecipes = await dbHelper.getAllRecipes();
  setState(() {
    recipes = loadedRecipes;
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Recetas')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    recipe.imageUrl.isNotEmpty
                    ? Image.file(File(recipe.imageUrl))
                    : const Placeholder(fallbackHeight: 150),
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                  ],
                  
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeCreationScreen(),
            ),
          );
          if (result == true) {
          // Refrescar recetas si se añadió una nueva
          _loadRecipes();
          }
        },
        backgroundColor:
        Colors.amber,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

