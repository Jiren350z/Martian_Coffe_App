import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/rate_.dart';
//import 'package:martian_cofee_app/pages/product_detail_page.dart';
//import 'package:martian_cofee_app/models/shop_class.dart';

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
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
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
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
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
              const SizedBox(height: 10),
              
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
                ],
              ),
              const SizedBox(height: 10),

              // Fecha de registro
              Text(
                'Fecha de registro: ${widget.recipe.registrationDate}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Duración total de la preparación
              const Text(
                'Duración total de la preparación: 00:00:00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 10),

              /*
              // Productos relacionados (Scroll horizontal)
              const Text('Productos relacionados:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    final product = widget.recipe.ingredients[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: 200,
                        child: ListTile(
                          leading: Image.asset(
                            product.imageOfProduct,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Precio: \$${product.price}', style: const TextStyle(color: Colors.green)),
                              Text('Stock: ${product.stock}'),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    starIndex < product.rating ? Icons.star : Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductWidget(product: product),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              */
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

/*
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
*/