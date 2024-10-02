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
  bool isFavorite = false; 
  int userRating = 0;

  final TextEditingController comment = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name)),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.recipe.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < widget.recipe.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
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
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
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
                      userRating = result;
                    });
                  }
                },
                child: const Text('Calificar'),
              ),
              const SizedBox(height: 10),
              const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.recipe.ingredients.map((ingredient) {
                  return Text('- ${ingredient.type} (${ingredient.value} unidades)', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Utensilios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.recipe.utensils.map((utensil) {
                  return Text('- $utensil', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Preparación:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.recipe.preparation, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Creador: ${widget.recipe.userCreator.name}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 100),
              TextField(
                controller: comment,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Escribe un comentario...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
