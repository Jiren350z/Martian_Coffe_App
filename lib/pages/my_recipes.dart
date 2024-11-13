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

/*
Widget _buildImage(RecipeNew recipe) {
    // Intenta cargar la imagen de asset o de archivo y maneja el error si ambas fallan.
    return recipe.isAssetImage
        ? Image.asset(
            recipe.imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            
            errorBuilder: (context, error, stackTrace) {
              return recipe.imageUrl.isNotEmpty
                  ? Image.file(
                      File(recipe.imageUrl),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Imagen no disponible',
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    )
                  : const Placeholder(fallbackHeight: 150);
            },
            
          )
        : recipe.imageUrl.isNotEmpty
            ? Image.file(
                File(recipe.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Imagen no disponible',
                    style: TextStyle(color: Colors.red),
                  );
                },
              )
            : const Placeholder(fallbackHeight: 150);
  }
*/
Widget _buildImage(RecipeNew recipe) {
 
 recipe.isAssetImage = recipe.imageUrl.startsWith('assets/');
 
  return Container(
    width: double.infinity,
    height: 200,
    child: recipe.isAssetImage
        ? Image.asset(
            recipe.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'Error al cargar la imagen de asset',
                style: TextStyle(color: Colors.red),
              );
            },
          )
        : Image.file(
            File(recipe.imageUrl),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'Error al cargar la imagen del archivo',
                style: TextStyle(color: Colors.red),
              );
            },
          ),
  );
}
/*
Widget _buildImage(RecipeNew recipe) {
    // Verifica si es una imagen de asset o archivo
  return recipe.isAssetImage
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
    : const Placeholder(fallbackHeight: 150);
}
*/

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
                    builder: (context) => RecipeDetailPage(recipe: recipe, fromJson: false),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(recipe), // Llama al método para construir la imagen
                    /*
                    Image.asset(
                    recipe.imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error al cargar la imagen');
                    },
                  ),
                    recipe.imageUrl.isNotEmpty
                    ? Image.file(
                    File(recipe.imageUrl),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  )
                  :const Placeholder(fallbackHeight: 150),
                  */
                    //_buildImage(recipe), // Llama al método para construir la imagen
                    /*
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
                      */                   
                    /*
                    Image.asset(
                      recipe.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    */
                    /*
                    recipe.imageUrl.isNotEmpty
                    ? Image.file(File(recipe.imageUrl))
                    : const Placeholder(fallbackHeight: 150),
                    */
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

