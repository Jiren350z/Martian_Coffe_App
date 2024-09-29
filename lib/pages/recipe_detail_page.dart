import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/rate_.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeNew recipe;
  
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  RecipeDetailPageState createState() => RecipeDetailPageState();
}

class RecipeDetailPageState extends State<RecipeDetailPage> {
  bool isFavorite = false; // Para controlar el estado del ícono de favoritos
  int userRating = 0;

  final TextEditingController comment = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.recipe.imageUrl,
              fit: BoxFit.cover, // Ajusta la imagen como necesites
              height: 200, // Altura de la imagen
              width: double.infinity, // Ancho completo
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error al cargar la imagen');
              },
            ),
            const SizedBox(height: 5),
            // Fila para estrellas y el ícono de favoritos
            Row(
              children: [
                // Mostrar las estrellas
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < widget.recipe.rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 30, // Aumentamos el tamaño de las estrellas
                    );
                  }),
                ),
                const SizedBox(width: 10),
                // Ícono de corazón para favoritos
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
                // Ícono de corazón para favoritos
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    color:  Colors.grey,

                  ),
                  onPressed: () {
 
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
                          ElevatedButton(
                onPressed: () async {
                  // Navegar a la página de calificación
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingPage(
                        initialRating: userRating,
                        recipeName: widget.recipe.name,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      userRating = result; // Actualizar la calificación al regresar
                    });
                  }
                },
                child: const Text('Calificar'),
              ),
            /* 
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Calificar'),
            ),
            */
            const SizedBox(height: 10),
            //mostrar ingredientes
            const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.recipe.ingredients.map((ingredient) {
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
              children: widget.recipe.utensils.map((utensil) {
                return Text('- $utensil', style: const TextStyle(fontSize: 16));
              }).toList(),
            ),
            const SizedBox(height: 10),
            // Sección de preparación
            const Text('Preparación:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              widget.recipe.preparation, // Aquí mostramos el texto de preparación
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 2),
            // Mostrar el creador de la receta
            Text(
              'Creador: ${widget.recipe.userCreator.name}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 100),
            TextField(
              controller: comment,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Fondo claro
                hintText: 'Escribe un comentario...',
                hintStyle: TextStyle(color: Colors.grey[600]), // Estilo del hint
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Espaciado interno
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin bordes visibles
                ),
                //prefixIcon: Icon(Icons.send, color: Colors.grey[600]), // Icono de emoji
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor), // Icono de enviar
                  onPressed: () {
                    // Funcionalidad para enviar el comentario
                    //print('Comentario enviado: ${comment.text}');
                    //comment.clear(); // Limpiar el campo de texto después de enviar
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

