//import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
import 'package:martian_cofee_app/utils/colors.dart';
import 'package:martian_cofee_app/utils/datebase_helper.dart';

class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();

  // Cargar las recetas directamente en el FutureBuilder
  Future<List<RecipeNew>> _loadRecipes() async {
    //await dbHelper.preloadRecipes(); // Esto carga las recetas desde el archivo JSON
    return await dbHelper.getRecipesFromJson(); // Luego obtenemos las recetas desde la base de datos
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Mi Barista')
        ),
      body: FutureBuilder<List<RecipeNew>>(
        future: _loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                recipe.isAssetImage = true;
                return Card(
                  color: AppColors.recipeContainerColor,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe, fromJson: true),
                        ),
                      ).then((value) {
                        setState(() {}); // Refrescar la lista de recetas al volver
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          recipe.isAssetImage
                          ? Image.asset(
                              recipe.imageUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('Error al cargar la imagen');
                              },
                            )
                          : recipe.imageUrl.isNotEmpty
                            ? Image.file(
                                File(recipe.imageUrl),
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              )
                            : const Placeholder(fallbackHeight: 150),
                         
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

