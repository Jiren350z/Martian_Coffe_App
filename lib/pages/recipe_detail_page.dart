//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'dart:io';
import 'package:martian_cofee_app/utils/datebase_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:martian_cofee_app/utils/colors.dart';
//import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:path/path.dart';

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

     bool isAssetImage = widget.recipe.imageUrl.startsWith('assets/');

  if (isAssetImage) {
    try {
      // Si la receta usa una imagen de asset, la convertimos en archivo
      final ByteData data = await rootBundle.load(widget.recipe.imageUrl);
      final Uint8List bytes = data.buffer.asUint8List();
      
      // Obtenemos el directorio temporal
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${basename(widget.recipe.imageUrl)}');

      // Escribimos los bytes en el archivo temporal
      await tempFile.writeAsBytes(bytes);

      // Ahora compartimos el archivo temporal
      await Share.shareXFiles(
        [XFile(tempFile.path)], // Ruta del archivo temporal
        text: recipeDetails,
        subject: 'Receta: ${widget.recipe.name}',
      );
    } catch (e) {
      // Si ocurre un error al compartir, solo compartimos el texto
      Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
    }
  } else if (widget.recipe.imageUrl.isNotEmpty) {
    // Si la receta tiene una imagen de archivo
    try {
      await Share.shareXFiles(
        [XFile(widget.recipe.imageUrl)], // Compartimos la ruta del archivo
        text: recipeDetails,
        subject: 'Receta: ${widget.recipe.name}',
      );
    } catch (e) {
      // Si ocurre un error al compartir, solo compartimos el texto
      Share.share(recipeDetails, subject: 'Receta: ${widget.recipe.name}');
    }
  } else {
    // Si no tiene imagen, solo compartimos el texto
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

  // Formatear la fecha de registro
  String _formatDate(DateTime date) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy'); // Puedes cambiar el formato aquí
    return dateFormat.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
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
                    Text('Fecha de Registro: ${_formatDate(widget.recipe.registrationDate)}', // Mostramos la fecha formateada
                        style: const TextStyle(fontSize: 16)),    
                    const SizedBox(height: 10),
                    Text('Duración total de la preparación: ${widget.recipe.preparationTime} minutos',
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
                  ],
                ),
        ),
      ),
    );
  }
}

