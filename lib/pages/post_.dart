import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/post_class.dart'; // Asegúrate de tener la clase PostNew.
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
import 'package:martian_cofee_app/pages/ingredient_detail_page.dart';


class PostListWidget extends StatelessWidget {
  final List<PostNew> posts; // Lista de publicaciones
  
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
                  // Header con foto de perfil, nombre de usuario, tipo de publicación y menú de 3 puntos
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
                          //Text(post.publicDate.toString(), style: const TextStyle(color: Colors.grey)),
                          const SizedBox(width: 10),
                          const Icon(Icons.more_vert), // 3 puntos de menú
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // Imagen de la publicación
                  GestureDetector(
                    onTap: () {
                      // Acción para abrir receta, ingrediente, etc.
                      if (post.pubType == 'Receta') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(recipe: post.recipe),
                          ),
                        );
                      }
                      // Acción para abrir receta, ingrediente, etc.
                      if (post.pubType == 'Ingrediente') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientWidget(ingredient: post.ingredient),
                          ),
                        );
                      }
                      /*
                      if (post.pubType == 'Método') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientWidget(ingredient: post.ingredient),
                          ),
                        );
                      }
                      */
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
                  // Imagen de la publicación

                  const SizedBox(height: 10),
                  
                  // Descripción de la publicación
                  Text(post.statement),
                  
                  const SizedBox(height: 10),

                  // Para publicaciones de recetas, ingredientes o métodos, mostramos las estrellas de valoración
                  if (post.pubType == 'Receta' || post.pubType == 'Ingrediente' || post.pubType == 'Método') 
                    Row(
                      children: List.generate(5, (starIndex) {
                        double rating;

                        // Determina la valoración según el tipo de publicación
                        if (post.pubType == 'Receta') {
                          rating = post.recipe.rating; // Obtén la valoración de la receta
                        } else if (post.pubType == 'Ingrediente') {
                          rating = post.ingredient.rating; // Supón que tienes un campo `rating` en IngredientNew
                        } else if (post.pubType == 'Método') {
                          rating = post.preparationMetod.rating; // Supón que tienes un campo `rating` en PreparationMetodNew
                        } else {
                          rating = 0; // Valor por defecto si no es ninguno de los tipos esperados
                        }

                        // Devuelve el icono correspondiente
                        return Icon(
                          starIndex < rating ? Icons.star : Icons.star_border,
                          color: const Color.fromARGB(255, 234, 211, 8),
                          size: 20,
                        );
                      }),
                    ),
                    /*
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < post.recipe.rating ? Icons.star : Icons.star_border,
                          color: const Color.fromARGB(255, 234, 211, 8),
                          size: 20,
                        );
                      }),
                    ),
                  */  
                  const SizedBox(height: 10),
                  // Botones de interacción (favoritos, comentarios, compartir)
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

                      //SizedBox(height: 5),
                    ],

                  ),
                  const SizedBox(height: 15),
                  // Barra para añadir comentarios
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
          // Acción para agregar una publicación
        },
        backgroundColor: const Color.fromARGB(255, 234, 227, 10),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}