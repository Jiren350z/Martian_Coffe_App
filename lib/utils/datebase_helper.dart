import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:martian_cofee_app/models/recipe_class.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'martian_coffee.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    
 
    //receta
    await db.execute('''
      CREATE TABLE recipes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,                
        imageUrl TEXT,            
        preparation TEXT,                 
        registrationDate TEXT,    
        preparationTime INTEGER,
        preparationCounter INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE recipe_utensils (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        recipeId INTEGER,         
        utensil TEXT,             
        FOREIGN KEY (recipeId) REFERENCES recipes(id)
      );
    ''');

  // Cambia `ingredientId` por `ingredient` como un texto.
  // Cambia `ingredientId` por `ingredient` como un texto.
    await db.execute('''
      CREATE TABLE recipe_ingredients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        recipeId INTEGER,
        ingredient TEXT,
        FOREIGN KEY (recipeId) REFERENCES recipes(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE recipe_products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        recipeId INTEGER,
        product TEXT,
        FOREIGN KEY (recipeId) REFERENCES recipes(id)
      );
    ''');
 
  }

  /////////////////



  //receta
    Future<int> insertRecipe(RecipeNew recipe) async {
    final db = await database;

    int recipeId = await db.insert(
      'recipes',
      {
        'name': recipe.name,
        'imageUrl': recipe.imageUrl,
        'preparation': recipe.preparation,
        'registrationDate': recipe.registrationDate.toIso8601String(),
        'preparationTime': recipe.preparationTime,
        'preparationCounter': recipe.preparationCounter,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Inserta los ingredientes como texto en `recipe_ingredients`
    for (final ingredient in recipe.ingredients) {
      await db.insert(
        'recipe_ingredients',
        {
          'recipeId': recipeId,
          'ingredient': ingredient,  // Ahora `ingredient` es un String directamente.
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Inserta los utensilios en la tabla `recipe_utensils`
    for (final utensil in recipe.utensils) {
      await db.insert(
        'recipe_utensils',
        {
          'recipeId': recipeId,
          'utensil': utensil,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }


    for (final product in recipe.products) {
      await db.insert(
        'recipe_products',
        {
          'recipeId': recipeId,
          'product': product,  
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return recipeId;
  }

  Future<RecipeNew?> getRecipe(int id) async {
    final db = await database;

    final recipeMap = await db.query(
      'recipes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (recipeMap.isEmpty) return null;

    final utensilMaps = await db.query(
      'recipe_utensils',
      where: 'recipeId = ?',
      whereArgs: [id],
    );

    // Recupera los ingredientes como una lista de Strings
    final ingredientMaps = await db.query(
      'recipe_ingredients',
      where: 'recipeId = ?',
      whereArgs: [id],
    );

    final productMaps = await db.query(
      'recipe_products',
      where: 'recipeId = ?',
      whereArgs: [id],
    );

    List<String> utensils = utensilMaps.map((map) => map['utensil'] as String).toList();
    List<String> ingredients = ingredientMaps.map((map) => map['ingredient'] as String).toList();
    List<String> products = productMaps.map((map) => map['product'] as String).toList();

    // Crea el objeto RecipeNew
    RecipeNew recipe = RecipeNew(
      name: recipeMap.first['name'] as String,
      ingredients: ingredients,
      utensils: utensils,
      preparation: recipeMap.first['preparation'] as String,
      imageUrl: recipeMap.first['imageUrl'] as String,
      registrationDate: DateTime.parse(recipeMap.first['registrationDate'] as String),
      preparationTime: recipeMap.first['preparationTime'] as int,
      products: products,
      preparationCounter: recipeMap.first['preparationCounter'] as int,
    );

    return recipe;
  }

  Future<List<RecipeNew>> getAllRecipes() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('recipes');

  List<RecipeNew> recipes = [];

  for (var recipeMap in maps) {
    // Consulta de ingredientes y utensilios para cada receta
    final List<Map<String, dynamic>> ingredientMaps = await db.query(
      'recipe_ingredients',
      where: 'recipeId = ?',
      whereArgs: [recipeMap['id']],
    );

    final List<Map<String, dynamic>> utensilMaps = await db.query(
      'recipe_utensils',
      where: 'recipeId = ?',
      whereArgs: [recipeMap['id']],
    );

    final List<Map<String, dynamic>> productMaps = await db.query(
      'recipe_products',
      where: 'recipeId = ?',
      whereArgs: [recipeMap['id']],
    );

    // Mapear los resultados a listas de String
    List<String> ingredients = ingredientMaps.map((map) => map['ingredient'] as String).toList();
    List<String> utensils = utensilMaps.map((map) => map['utensil'] as String).toList();
    List<String> products = productMaps.map((map) => map['product'] as String).toList();

    // Añadir el objeto `RecipeNew` a la lista
    recipes.add(
      RecipeNew(
        name: recipeMap['name'],
        ingredients: ingredients,
        utensils: utensils,
        preparation: recipeMap['preparation'],
        imageUrl: recipeMap['imageUrl'],
        registrationDate: DateTime.parse(recipeMap['registrationDate']),
        preparationTime: recipeMap['preparationTime'],
        products: products,  // Agregar los productos
        preparationCounter: recipeMap['preparationCounter'] as int,
      ),
    );
  }

  return recipes;
}

  
  Future<void> preloadRecipes() async {
    final db = await database;

    // Comprueba si la tabla ya tiene recetas
    final List<Map<String, dynamic>> existingRecipes = await db.query('recipes');
    if (existingRecipes.isNotEmpty) {
      return; // Ya hay recetas, no se hace nada
    }

    // Cargar el archivo JSON
    final String jsonString = await rootBundle.loadString('assets/json/recipes.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);

    // Insertar cada receta en la base de datos
    for (var item in jsonData) {
      final recipe = RecipeNew(
        name: item['name'],
        ingredients: List<String>.from(item['ingredients']),
        utensils: List<String>.from(item['utensils']),
        preparation: item['preparation'],
        imageUrl: item['imageUrl'],
        registrationDate: DateTime.parse(item['registrationDate']),
        preparationTime: item['preparationTime'],
        products: List<String>.from(item['products']),
        preparationCounter: item['preparationCounter']
      );

      await insertRecipe(recipe);
    }
  }

  Future<List<RecipeNew>> getRecipesFromJson() async {
  // Cargar el archivo JSON
  final String jsonString = await rootBundle.loadString('assets/json/recipes.json');
  final List<dynamic> jsonData = jsonDecode(jsonString);

  // Convertir los datos JSON en una lista de objetos RecipeNew
  List<RecipeNew> recipes = jsonData.map((item) {
    return RecipeNew(
      name: item['name'],
      ingredients: List<String>.from(item['ingredients']),
      utensils: List<String>.from(item['utensils']),
      preparation: item['preparation'],
      imageUrl: item['imageUrl'],
      registrationDate: DateTime.parse(item['registrationDate']),
      products: List<String>.from(item['products']),
      preparationTime: item['preparationTime'],
      preparationCounter: item['preparationCounter']
    );
  }).toList();

  return recipes;
}


Future<void> updateRecipe(RecipeNew recipe) async {
  final db = await database;

  // Recupera el 'id' de la receta desde la base de datos (asumiendo que ya existe)
  final List<Map<String, dynamic>> recipeMaps = await db.query(
    'recipes',
    where: 'name = ?',
    whereArgs: [recipe.name], // Usamos 'name' o cualquier campo único que tengas
  );

  if (recipeMaps.isNotEmpty) {
    final recipeId = recipeMaps.first['id'];

    // Realiza la actualización de la receta con el id obtenido
    await db.update(
      'recipes',
      {
        'name': recipe.name,
        'imageUrl': recipe.imageUrl,
        'preparation': recipe.preparation,
        'registrationDate': recipe.registrationDate.toIso8601String(),
        'preparationTime': recipe.preparationTime,
        'preparationCounter': recipe.preparationCounter,
      },
      where: 'id = ?',
      whereArgs: [recipeId],
    );

    await db.delete('recipe_ingredients', where: 'recipeId = ?', whereArgs: [recipeId]);
    await db.delete('recipe_utensils', where: 'recipeId = ?', whereArgs: [recipeId]);
    await db.delete('recipe_products', where: 'recipeId = ?', whereArgs: [recipeId]);

    // Actualiza los ingredientes
    for (final ingredient in recipe.ingredients) {
      await db.insert(
        'recipe_ingredients',
        {
          'recipeId': recipeId,
          'ingredient': ingredient,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Actualiza los utensilios
    for (final utensil in recipe.utensils) {
      await db.insert(
        'recipe_utensils',
        {
          'recipeId': recipeId,
          'utensil': utensil,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Actualiza los productos
    for (final product in recipe.products) {
      await db.insert(
        'recipe_products',
        {
          'recipeId': recipeId,
          'product': product,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}



/*
Future<void> updateRecipe(RecipeNew recipe) async {
  final db = await database;
  await db.update(
    'recipes',
    recipe.toMap(),
    where: 'id = ?',
    whereArgs: [recipe],
  );
}
*/
  
}