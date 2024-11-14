import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'dart:io';
import 'package:martian_cofee_app/utils/datebase_helper.dart';
import 'package:share_plus/share_plus.dart';

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
  late TextEditingController productsController;
  late TextEditingController prepCounterController;
  late TextEditingController preparationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.recipe.name);
    prepTimeController = TextEditingController(text: widget.recipe.preparationTime.toString());
    ingredientsController = TextEditingController(text: widget.recipe.ingredients.join(', '));
    utensilsController = TextEditingController(text: widget.recipe.utensils.join(', '));
    productsController = TextEditingController(text: widget.recipe.products.join(', '));
    prepCounterController = TextEditingController(text: widget.recipe.preparationCounter.toString());
    preparationController = TextEditingController(text: widget.recipe.preparation);
  }

  @override
  void dispose() {
    nameController.dispose();
    prepTimeController.dispose();
    ingredientsController.dispose();
    utensilsController.dispose();
    productsController.dispose();
    prepCounterController.dispose();
    preparationController.dispose();
    super.dispose();
  }

  Future<void> _saveRecipe() async {
    setState(() {
      widget.recipe.name = nameController.text;
      widget.recipe.preparationTime = int.tryParse(prepTimeController.text) ?? widget.recipe.preparationTime;
      widget.recipe.ingredients = ingredientsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.utensils = utensilsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.products = productsController.text.split(',').map((e) => e.trim()).toList();
      widget.recipe.preparationCounter = int.tryParse(prepCounterController.text) ?? widget.recipe.preparationCounter;
      widget.recipe.preparation = preparationController.text;
    });

    final db = DatabaseHelper();

    if (widget.fromJson) {
      await db.insertRecipe(widget.recipe);
    } else {
      await db.updateRecipe(widget.recipe);
    }

    setState(() {
      isEditing = false;
    });
  }

  // Función para compartir la receta
  void shareRecipe() async {
    final String recipeDetails = '''
    ${widget.recipe.name}
    
    Duración total de la preparación: ${widget.recipe.preparationTime} minutos
    
    Ingredientes:
    ${widget.recipe.ingredients.map((ingredient) => '- $ingredient').join('\n')}
    
    Utensilios:
    ${widget.recipe.utensils.map((utensil) => '- $utensil').join('\n')}

    Productos:
    ${widget.recipe.products.map((product) => '- $product').join('\n')}

    Veces Preparada: ${widget.recipe.preparationCounter} veces
    
    Preparación:
    ${widget.recipe.preparation}
  ''';

    if (!widget.recipe.isAssetImage && widget.recipe.imageUrl.isNotEmpty) {
      try {
        await Share.shareXFiles(
          [XFile(widget.recipe.imageUrl)],
          text: recipeDetails,
          subject: 'Receta: ${widget.recipe.name}',
        );
      } catch (e) {
        Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
      }
    } else {
      Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
    }
  }

  // Incrementar el contador de preparaciones
  void _incrementPreparationCounter() {
    setState(() {
      widget.recipe.preparationCounter++;
    });

    final db = DatabaseHelper();
    db.updateRecipe(widget.recipe); // Actualiza el contador en la base de datos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shareRecipe,
          ),
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
                      decoration: const InputDecoration(labelText: 'Ingredientes'),
                    ),
                    TextField(
                      controller: utensilsController,
                      decoration: const InputDecoration(labelText: 'Utensilios'),
                    ),
                    TextField(
                      controller: productsController,
                      decoration: const InputDecoration(labelText: 'Productos'),
                    ),
                    TextField(
                      controller: prepCounterController,
                      decoration: const InputDecoration(labelText: 'Veces Preparada'),
                      keyboardType: TextInputType.number,
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
                    const Text('Productos:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...widget.recipe.products.map((product) => Text('- $product', style: const TextStyle(fontSize: 16))),
                    const SizedBox(height: 10),
                    const Text('Veces preparada: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${widget.recipe.preparationCounter} veces', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _incrementPreparationCounter,
                      child: const Text('La Volvere a Preparar'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
        ),
      ),
    );
  }
}
/*
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

  void shareRecipe() async {  // Agrega 'async' aquí
  final String recipeDetails = '''
    ${widget.recipe.name}
    
    Duración total de la preparación: ${widget.recipe.preparationTime} minutos
    
    Ingredientes:
    ${widget.recipe.ingredients.map((ingredient) => '- $ingredient').join('\n')}
    
    Utensilios:
    ${widget.recipe.utensils.map((utensil) => '- $utensil').join('\n')}
    
    Preparación:
    ${widget.recipe.preparation}
  ''';

  // Verifica si la receta tiene una imagen disponible
  if (!widget.recipe.isAssetImage && widget.recipe.imageUrl.isNotEmpty) {
    try {
      // Usa shareXFiles para compartir la receta con el texto y la imagen
      await Share.shareXFiles(
        [XFile(widget.recipe.imageUrl)],  // Utiliza XFile para la imagen
        text: recipeDetails,
        subject: 'Receta: ${widget.recipe.name}',
      );
    } catch (e) {
      print("Error al compartir la imagen: $e");
      // Si hay un error con la imagen, comparte solo el texto
      Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
    }
  } else {
    // Comparte solo el texto si no hay imagen
    Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shareRecipe,
          ),
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
*/
