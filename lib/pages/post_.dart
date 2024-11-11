/*
import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/post_class.dart';
import 'package:martian_cofee_app/pages/add_recipe.dart'; 
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
import 'package:martian_cofee_app/pages/ingredient_detail_page.dart';
import 'package:martian_cofee_app/pages/preparation_metod__details_.dart';


class PostListWidget extends StatelessWidget {
  final List<PostNew> posts; //lista de publicaciones
  
  const PostListWidget({super.key, required this.posts});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publicaciones')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final TextEditingController comment = TextEditingController();
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              post.userData.profileURL,
                            ),
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.userData.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(post.pubType, style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(post.timeSincePublication()),
                          
                          const SizedBox(width: 10),
                          const Icon(Icons.more_vert), 
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  

                  GestureDetector(
                    onTap: () {
                      //ir a detalles de la receta.
                      if (post.pubType == 'Receta') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(recipe: post.recipe/*, product: post.productt*/),
                          ),
                        );
                      }
                      //ir a detalles del ingrediente
                      if (post.pubType == 'Ingrediente') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientWidget(ingredient: post.ingredient),
                          ),
                        );
                      }
                      
                      if (post.pubType == 'Método') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreparationMethodDetailPage(preparationMethod: post.preparationMetod),
                          ),
                        );
                      }
                      
                    },

                    child: Image.asset(
                      post.image,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                  ),


                  const SizedBox(height: 10),
                  

                  Text(post.statement),
                  
                  const SizedBox(height: 10),

                  
                  if (post.pubType == 'Receta' || post.pubType == 'Ingrediente' || post.pubType == 'Método') 
                    Row(
                      children: List.generate(5, (starIndex) {
                        double rating;

                        
                        if (post.pubType == 'Receta') {
                          rating = post.recipe.rating; 
                        } else if (post.pubType == 'Ingrediente') {
                          rating = post.ingredient.rating; 
                        } else if (post.pubType == 'Método') {
                          rating = post.preparationMetod.rating; 
                        } else {
                          rating = 0; 
                        }

      
                        return Icon(
                          starIndex < rating ? Icons.star : Icons.star_border,
                          color:  Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
 
                  const SizedBox(height: 10),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite_border),
                          SizedBox(width: 10),
                          Icon(Icons.comment),
                          SizedBox(width: 10),
                          Icon(Icons.share),
                        ],
                      ),


                    ],

                  ),
                  const SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            child: 
                            TextField(
                                controller: comment,
                                decoration: const InputDecoration(
                                hintText: 'Añadir un comentario...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ], 
                      ),
                ],
              ),
            ),
            
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecipeCreationScreen (),
                  ),
             );
        },
        backgroundColor:
        Colors.amber,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
*/