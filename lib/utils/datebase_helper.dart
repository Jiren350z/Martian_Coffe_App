import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:martian_cofee_app/models/ingredient_class.dart';
//import 'package:martian_cofee_app/models/post_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
//import 'package:martian_cofee_app/models/shop_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';

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
    
    //ingrediente
    await db.execute('''
      CREATE TABLE ingredients(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        value REAL,
        ubication TEXT,
        rating REAL,
        imageOfIngredient TEXT
      );
    ''');
    

    //metodo de preparacion
    await db.execute('''
      CREATE TABLE preparation_methods(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        preparationTime INTEGER,
        waterTemperature REAL,
        waterAmount REAL,
        coffeeAmount REAL,
        grindingThickness TEXT,
        equipment TEXT,
        flavorNotes TEXT,
        dificulty TEXT,
        filterType TEXT,
        recomendations TEXT,
        rating REAL,
        imageOfMetod TEXT
      );
    ''');

    //receta
    await db.execute('''
      CREATE TABLE recipes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,                
        imageUrl TEXT,            
        preparation TEXT,                 
        registrationDate TEXT,    
        preparationTime INTEGER
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

    //producto  
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price REAL,
        description TEXT,
        stock INTEGER,
        contact TEXT,
        imageOfProduct TEXT,
        rating REAL,
        shopId INTEGER,
        FOREIGN KEY (shopId) REFERENCES shops (id)
      )
    ''');

    //usuario  
      await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      biography TEXT,
      age INTEGER,
      genre TEXT,
      bornData TEXT,
      typeOfExperienceWithCoffee TEXT,
      country TEXT,
      region TEXT,
      city TEXT,
      profileURL TEXT
    )
  ''');

  await db.execute('''
    CREATE TABLE createdRecipes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      recipeData TEXT,
      userId INTEGER,
      FOREIGN KEY (userId) REFERENCES users (id)
    )
  ''');

  await db.execute('''
    CREATE TABLE purchasedProducts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      productData TEXT,
      userId INTEGER,
      FOREIGN KEY (userId) REFERENCES users (id)
    )
  ''');
  }

  /////////////////

  //ingrediente
  Future<int> insertIngredient(IngredientNew ingredient) async {
    final db = await database;
    return await db.insert('ingredients', ingredient.toMap());
  }

  Future<List<IngredientNew>> getIngredients() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('ingredients');
    return List.generate(maps.length, (i) {
      return IngredientNew.fromMap(maps[i]);
    });
  }

  //metodo de preparacion
  Future<int> insertPreparationMethod(PreparationMetodNew preparationMethod) async {
    final db = await database;
    return await db.insert('preparation_methods', preparationMethod.toMap());
  }
 
  Future<List<PreparationMetodNew>> getPreparationMethods() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('preparation_methods');
    return List.generate(maps.length, (i) {
      return PreparationMetodNew.fromMap(maps[i]);
    });
  }
  
  
  //producto
  Future<int> insertProduct(ProductNew product) async {
  final db = await database;
  return await db.insert('products', product.toMap());
}

Future<ProductNew?> getProduct(int id) async {
  final db = await database;
  final maps = await db.query(
    'products',
    where: 'id = ?',
    whereArgs: [id],
  );
  if (maps.isNotEmpty) {
    return ProductNew.fromMap(maps.first);
  }
  return null;
}

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

    List<String> utensils = utensilMaps.map((map) => map['utensil'] as String).toList();
    List<String> ingredients = ingredientMaps.map((map) => map['ingredient'] as String).toList();

    // Crea el objeto RecipeNew
    RecipeNew recipe = RecipeNew(
      name: recipeMap.first['name'] as String,
      ingredients: ingredients,
      utensils: utensils,
      preparation: recipeMap.first['preparation'] as String,
      imageUrl: recipeMap.first['imageUrl'] as String,
      registrationDate: DateTime.parse(recipeMap.first['registrationDate'] as String),
      preparationTime: recipeMap.first['preparationTime'] as int,
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

    // Mapear los resultados a listas de String
    List<String> ingredients = ingredientMaps.map((map) => map['ingredient'] as String).toList();
    List<String> utensils = utensilMaps.map((map) => map['utensil'] as String).toList();

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
      ),
    );
  }

  return recipes;
}

  /*
  Future<List<RecipeNew>> getAllRecipes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('recipes');

    return List.generate(maps.length, (i) {
      return RecipeNew(
        name: maps[i]['name'],
        ingredients: [], // Inicializa con la lista vacía o agrega lógica si es necesario.
        utensils: [],
        preparation: maps[i]['preparation'],
        imageUrl: maps[i]['imageUrl'],
        registrationDate: DateTime.parse(maps[i]['registrationDate']),
        preparationTime: maps[i]['preparationTime'],
      );
    });
  }
  */


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
        //rating: item['rating'],
        registrationDate: DateTime.parse(item['registrationDate']),
        preparationTime: item['preparationTime'],
      );

      await insertRecipe(recipe);
    }
  }



  //usuario
  Future<int> insertUser(UserNew user) async {
    final db = await database;

    // Inserta el usuario en la tabla de usuarios
    int userId = await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Inserta las relaciones (productos, recetas, etc.)
    for (var recipe in user.createdRecipe) {
      await db.insert(
        'createdRecipes',
        recipe.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var product in user.purshasedProducts) {
      await db.insert(
        'purchasedProducts',
        product.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var favoriteRecipe in user.favoritesRecipes) {
      await db.insert(
        'favoriteRecipes',
        favoriteRecipe.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var preparationMethod in user.favoritedPreparationMetods) {
      await db.insert(
        'favoritedPreparationMethods',
        preparationMethod.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var favoriteProduct in user.favoritesProducts) {
      await db.insert(
        'favoritesProducts',
        favoriteProduct.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var ingredient in user.favoritesIngredient) {
      await db.insert(
        'favoritesIngredients',
        ingredient.toMap()..['userId'] = userId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return userId;
  }

  Future<UserNew?> getUser(int id) async {
    final db = await database;

    // Recupera el usuario de la tabla de usuarios
    final userMap = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (userMap.isEmpty) return null;

    // Recupera las relaciones de otras tablas usando userId
    final createdRecipeMaps = await db.query(
      'createdRecipes',
      where: 'userId = ?',
      whereArgs: [id],
    );

    final purchasedProductMaps = await db.query(
      'purchasedProducts',
      where: 'userId = ?',
      whereArgs: [id],
    );

    final favoriteRecipeMaps = await db.query(
      'favoriteRecipes',
      where: 'userId = ?',
      whereArgs: [id],
    );

    final favoritedPreparationMethodMaps = await db.query(
      'favoritedPreparationMethods',
      where: 'userId = ?',
      whereArgs: [id],
    );

    final favoriteProductMaps = await db.query(
      'favoritesProducts',
      where: 'userId = ?',
      whereArgs: [id],
    );

    final favoriteIngredientMaps = await db.query(
      'favoritesIngredients',
      where: 'userId = ?',
      whereArgs: [id],
    );

    // Convierte los datos en listas de objetos
    List<RecipeNew> createdRecipes = createdRecipeMaps.map((map) => RecipeNew.fromMap(map)).toList();
    List<ProductNew> purchasedProducts = purchasedProductMaps.map((map) => ProductNew.fromMap(map)).toList();
    List<RecipeNew> favoriteRecipes = favoriteRecipeMaps.map((map) => RecipeNew.fromMap(map)).toList();
    List<PreparationMetodNew> favoritedPreparationMethods = favoritedPreparationMethodMaps.map((map) => PreparationMetodNew.fromMap(map)).toList();
    List<ProductNew> favoriteProducts = favoriteProductMaps.map((map) => ProductNew.fromMap(map)).toList();
    List<IngredientNew> favoriteIngredients = favoriteIngredientMaps.map((map) => IngredientNew.fromMap(map)).toList();

    // Crea y retorna el objeto UserNew
    return UserNew.fromMap(userMap.first)
      ..createdRecipe = createdRecipes
      ..purshasedProducts = purchasedProducts
      ..favoritesRecipes = favoriteRecipes
      ..favoritedPreparationMetods = favoritedPreparationMethods
      ..favoritesProducts = favoriteProducts
      ..favoritesIngredient = favoriteIngredients;
  }

  
}