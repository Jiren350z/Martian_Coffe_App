import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeNew recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  RecipeDetailPageState createState() => RecipeDetailPageState();
}

class RecipeDetailPageState extends State<RecipeDetailPage> {
  bool isFavorite = false; // Para controlar el estado del ícono de favoritos

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
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Calificar'),
            ),
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
            const SizedBox(height: 10),
            // Mostrar el creador de la receta
            Text(
              'Creador: ${widget.recipe.userCreator.name}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

//version vieja
/*
class RecipeDetailPage extends StatelessWidget {
  
  final RecipeNew recipe;

  //bool isFavorite = false;

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
            Image.asset(
              recipe.imageUrl,
              fit: BoxFit.cover, // Ajusta la imagen como necesites
              height: 200, // Altura de la imagen
              width: double.infinity, // Ancho completo
              errorBuilder: (context, error, stackTrace) {
              return const Text('Error al cargar la imagen');
              },
            ),
            const SizedBox(height: 5),
            

            
            
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    starIndex < recipe.rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 20,
                    );
                  }),
                ),
            
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('Calificar'),
            ),    
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
            const Text('Preparación:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
         
            Text(
              'Creador: ${recipe.userCreator.name}',
              style: const TextStyle(fontSize: 16),
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
*/