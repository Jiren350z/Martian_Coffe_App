import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
//import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/utils/datebase_helper.dart';

class RecipeCreationScreen extends StatefulWidget {
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController utensilsController = TextEditingController();
  final TextEditingController preparationTimeController = TextEditingController();
  //String selectedMethod = 'Método 1';
  //String selectedGrind = 'Fina';
  //final TextEditingController waterController = TextEditingController();
  //final TextEditingController coffeeController = TextEditingController();
  //final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];
  File? imageFile;

  final ImagePicker picker = ImagePicker();

  // Función para abrir la cámara
  Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // Función para abrir la galería
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void addStep() {
    setState(() {
      preparationSteps.add({
        'description': TextEditingController(),
      });
    });
  }

  Future<void> saveRecipe() async {
  // Crear una lista de ingredientes separada por comas
  /*
  final List<String> ingredients = ingredientsController.text.split(',').map((e) => e.trim()).toList();
  */
  final List<String> ingredients = ingredientsController.text.split(',').map((e) => e.trim()).toList();
  
  /*
  final List<IngredientNew> ingredients = ingredientsController.text
    .split(',')
    .map((e) => IngredientNew(
          type: e.trim(),
          value: 0.0, // Valor predeterminado; cámbialo si es necesario
          ubication: 'Unknown', // Valor predeterminado; cámbialo si es necesario
          rating: 0.0, // Valor predeterminado; cámbialo si es necesario
          imageOfIngredient: '', // Valor predeterminado; cámbialo si es necesario
        ))
    .toList();
  */  
  // Crear una lista de utensilios separada por comas
  final List<String> utensils = utensilsController.text.split(',').map((e) => e.trim()).toList();
  
  // Crear una lista de pasos de preparación a partir de los controladores
  final List preparationDescriptions = preparationSteps
      .map((step) => step['description'].text)
      .where((description) => description.isNotEmpty)
      .toList();

  final recipe = RecipeNew(
    name: nameController.text,
    ingredients: ingredients,
    utensils: utensils,
    preparation: preparationDescriptions.join('\n'), // Unir cada paso con una nueva línea
    imageUrl: imageFile?.path ?? '',
    //rating: 0,
    registrationDate: DateTime.now(),
    preparationTime: int.tryParse(preparationTimeController.text) ?? 0,
  );

  final dbHelper = DatabaseHelper();
  await dbHelper.insertRecipe(recipe);

  // Mostrar mensaje de confirmación
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Receta guardada correctamente')),
  );
}

  /*
  Future<void> saveRecipe() async {
    final recipe = RecipeNew(
    name: 'cachirula',
    ingredients: [], // Debes incluir los ingredientes
    utensils: [], // Debes incluir los utensilios
    preparation: 'asdasfas fafd dtsdgdsg',
    /*
    userCreator: UserNew(
      name: 'Usuario Ejemplo',
      email: "imprimansuenio@gmail.com",
      biography: "Amo el cafe",
      typeOfExperienceWithCoffee: "Consumidor",
      age: 24,
      genre: "Masculino",
      bornData: DateTime(2000,5,6),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
      history: [],
      country: "EE.UU",
      region: "Ohio",
      city: "Colombus",
      profileURL: '',
      registrationDate: DateTime(2009,4,10),
    ),
    */
    imageUrl: imageFile?.path ?? '',
    rating: 4.0,
    registrationDate: DateTime.now(),
    preparationTime: int.tryParse(preparationTimeController.text) ?? 0,
  );
  

  final dbHelper = DatabaseHelper();
  await dbHelper.insertRecipe(recipe);
  // Mostrar mensaje de confirmación
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Receta guardada correctamente')),
  );

  }
  */

  void showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Agregar foto de la receta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, size: 30),
                    onPressed: () {
                      _takePhoto();
                      Navigator.pop(context); // Cierra el modal
                    },
                    tooltip: 'Tomar foto con la cámara',
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_library, size: 30),
                    onPressed: () {
                      _pickImageFromGallery();
                      Navigator.pop(context); // Cierra el modal
                    },
                    tooltip: 'Seleccionar foto de la galería',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Nombre de la receta", style: TextStyle(fontSize: 18)),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            
            const Text("Ingredientes (separados por coma)", style: TextStyle(fontSize: 18)),
            TextField(
              controller: ingredientsController,
              decoration: const InputDecoration(labelText: 'Ingredientes'),
            ),
            const SizedBox(height: 16),

            const Text("Utensilios (separados por coma)", style: TextStyle(fontSize: 18)),
            TextField(
              controller: utensilsController,
              decoration: const InputDecoration(labelText: 'Utensilios'),
            ),
            const SizedBox(height: 16),

            const Text("Tiempo de preparación (en minutos)", style: TextStyle(fontSize: 18)),
            TextField(
              controller: preparationTimeController,
              decoration: const InputDecoration(labelText: 'Tiempo de preparación'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
              onPressed: showImageOptions,
              child: const Text('Agregar foto de la receta'),
              ),              
            ),
            
            const SizedBox(height: 16),

            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: step['description'],
                      decoration: const InputDecoration(labelText: 'Descripción del paso'),
                    ),
                  ),
                );
              },
            ),

           
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    
    nameController.dispose();
    ingredientsController.dispose();
    utensilsController.dispose();
    preparationTimeController.dispose();
    for (var step in preparationSteps) {
      step['description'].dispose();
    }


    super.dispose();
  }
}

