import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'dart:io';
import 'package:martian_cofee_app/utils/datebase_helper.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeNew recipe;
  final bool fromJson; // Indica si la receta viene del JSON

  const RecipeDetailPage({super.key, required this.recipe, required this.fromJson});

  @override
  RecipeDetailPageState createState() => RecipeDetailPageState();
}

class RecipeDetailPageState extends State<RecipeDetailPage> {
  bool isEditing = false;
  late TextEditingController nameController;
  late TextEditingController prepTimeController;
  late TextEditingController ingredientsController;
  late TextEditingController utensilsController;
  late TextEditingController preparationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.recipe.name);
    prepTimeController = TextEditingController(text: widget.recipe.preparationTime.toString());
    ingredientsController = TextEditingController(text: widget.recipe.ingredients.join(', '));
    utensilsController = TextEditingController(text: widget.recipe.utensils.join(', '));
    preparationController = TextEditingController(text: widget.recipe.preparation);
  }

  @override
  void dispose() {
    nameController.dispose();
    prepTimeController.dispose();
    ingredientsController.dispose();
    utensilsController.dispose();
    preparationController.dispose();
    super.dispose();
  }
  Future<void> _saveRecipe() async {
    setState(() {
      widget.recipe.name = nameController.text;
      widget.recipe.preparationTime = int.tryParse(prepTimeController.text) ?? widget.recipe.preparationTime;
      widget.recipe.ingredients = ingredientsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.utensils = utensilsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.preparation = preparationController.text;
    });

    final db = DatabaseHelper();

    if (widget.fromJson) {
      // Si es una receta precargada de JSON, guárdala en "Mis Recetas"
      await db.insertRecipe(widget.recipe);
    } else {
      // Si ya está en la base de datos, solo actualízala
      await db.updateRecipe(widget.recipe);
    }

    setState(() {
      isEditing = false;
    });
  }

  /*
  Future<void> _saveRecipe() async {
    setState(() {
      widget.recipe.name = nameController.text;
      widget.recipe.preparationTime = int.tryParse(prepTimeController.text) ?? widget.recipe.preparationTime;
      widget.recipe.ingredients = ingredientsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.utensils = utensilsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.preparation = preparationController.text;
    });

    // Lógica para actualizar la receta en la base de datos.
    await DatabaseHelper().updateRecipe(widget.recipe);

    setState(() {
      isEditing = false;
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          if (!isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
            ),
          if (isEditing)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveRecipe,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isEditing
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Nombre de la receta'),
                    ),
                    TextField(
                      controller: prepTimeController,
                      decoration: const InputDecoration(labelText: 'Duración de la preparación'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: ingredientsController,
                      decoration: const InputDecoration(labelText: 'Ingredientes (separados por comas)'),
                    ),
                    TextField(
                      controller: utensilsController,
                      decoration: const InputDecoration(labelText: 'Utensilios (separados por comas)'),
                    ),
                    TextField(
                      controller: preparationController,
                      decoration: const InputDecoration(labelText: 'Preparación'),
                      maxLines: 3,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        widget.recipe.isAssetImage
                        ? Image.asset(
                            widget.recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          )
                        : widget.recipe.imageUrl.isNotEmpty
                          ? Image.file(
                              File(widget.recipe.imageUrl),
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('Error al cargar la imagen');
                              },
                            )
                          : const Placeholder(fallbackHeight: 200),
                    /*
                    widget.recipe.imageUrl.isNotEmpty
                        ? Image.file(
                            File(widget.recipe.imageUrl),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          )
                        : const Placeholder(fallbackHeight: 200),
                        */
                    const SizedBox(height: 10),
                    Text('Duración total de la preparación: ${widget.recipe.preparationTime}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...widget.recipe.ingredients.map((ingredient) => Text('- $ingredient', style: const TextStyle(fontSize: 16))),
                    const SizedBox(height: 10),
                    const Text('Utensilios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...widget.recipe.utensils.map((utensil) => Text('- $utensil', style: const TextStyle(fontSize: 16))),
                    const SizedBox(height: 10),
                    const Text('Preparación:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(widget.recipe.preparation, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                  ],
                ),
        ),
      ),
    );
  }
}

//original y funcional
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
  //final TextEditingController comment = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
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
                widget.recipe.imageUrl.isNotEmpty
                ? Image.file(
                    File(widget.recipe.imageUrl),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error al cargar la imagen');
                    },
                  )
                : const Placeholder(fallbackHeight: 200),

              const SizedBox(height: 10),
              // Fecha de registro
              Text(
                'Fecha de registro: ${widget.recipe.registrationDate}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Duración total de la preparación
              Text(
                'Duración total de la preparación: ${widget.recipe.preparationTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Ingredientes
              const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.recipe.ingredients.map((ingredient) {
                  return Text('- $ingredient', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),

              // Utensilios
              const Text('Utensilios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.recipe.utensils.map((utensil) {
                  return Text('- $utensil', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),

              // Preparación
              const Text('Preparación:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.recipe.preparation, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              //productos
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
              
            ],
          ),
        ),
      ),
    );
  }
}
*/