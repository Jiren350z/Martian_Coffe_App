import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
//import 'package:martian_cofee_app/pages/product_detail_page.dart';

class MyRecipesWidget extends StatelessWidget {
  final List<RecipeNew> recipes;
  //final ProductWidget product;
  
  const MyRecipesWidget({super.key, required this.recipes/*, required this.product*/});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Recetas')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          //final productt = product;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            
            child: InkWell(
              onTap: () {
                // navegar a la pagina de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe /*, product: productt*/),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // mostrar la imagen de la receta
                    Image.asset(
                      recipe.imageUrl,
                      fit: BoxFit.cover, 
                      height: 200, // altura de la imagen
                      width: double.infinity, // ancho completo
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      recipe.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < recipe.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
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