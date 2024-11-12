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
    
    /*
    //post
    await db.execute('''
      CREATE TABLE posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userDataId INTEGER, -- ID del usuario que crea el post
        pubType TEXT,       -- Tipo de publicación
        recipeId INTEGER,   -- ID de la receta asociada
        ingredientId INTEGER, -- ID del ingrediente asociado
        preparationMethodId INTEGER, -- ID del método de preparación asociado
        image TEXT,         -- URL de la imagen del post
        statement TEXT,     -- Texto del post
        publicDate TEXT,    -- Fecha de publicación en formato ISO8601
        FOREIGN KEY (userDataId) REFERENCES users(id),
        FOREIGN KEY (recipeId) REFERENCES recipes(id),
        FOREIGN KEY (ingredientId) REFERENCES ingredients(id),
        FOREIGN KEY (preparationMethodId) REFERENCES preparation_methods(id)
      );
    ''');
    */

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

    /*
    //shop
    await db.execute('''
    CREATE TABLE shops (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      payMethods TEXT
    )
  ''');
    */

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
  /*
  Future<int> insertRecipe(RecipeNew recipe) async {
  final db = await database;
  //final db = await openDatabase('martian_coffee.db');
  

    int recipeId = await db.insert(
      'recipes',
      {
        'name': recipe.name,
        'imageUrl': recipe.imageUrl,
        'preparation': recipe.preparation,
        'rating': recipe.rating,
        'registrationDate': recipe.registrationDate.toIso8601String(),
        'preparationTime': recipe.preparationTime,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    
 

  /*
  Future<int> insertRecipe(RecipeNew recipe) async {
  final db = await database;

  // Inserta la receta en la tabla `recipes`
  
  int recipeId = await db.insert(
    'recipes',
    {
      'name': recipe.name,
      //'userCreatorId': recipe.userCreator.id, // Solo almacena el ID del usuario
      //'userCreator': recipe.userCreator,
      'imageUrl': recipe.imageUrl,
      'preparation': recipe.preparation,
      'rating': recipe.rating,
      'registrationDate': recipe.registrationDate.toIso8601String(),
      'preparationTime': recipe.preparationTime
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  */

  // Inserta los ingredientes en la tabla `recipe_ingredients`
  for (final ingredient in recipe.ingredients) {
    await db.insert(
      'recipe_ingredients',
      {
        'recipeId': recipeId,
        'ingredientId': ingredient.id, // Suponiendo que `ingredient` es un objeto con un `id`
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
*/
  /*
  Future<int> insertRecipe(RecipeNew recipe) async {
  final db = await database;

  // Inserta el creador de la receta en la tabla de usuarios (si no existe ya)
  /*
  int userId = await db.insert(
    'users',
    recipe.userCreator.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  */
  // Inserta la receta en la tabla de recetas
  int recipeId = await db.insert(
    'recipes',
    recipe.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  // Inserta los utensilios de la receta en la tabla de utensilios de recetas
  for (var utensil in recipe.utensils) {
    await db.insert(
      'recipe_utensils',
      {
        'recipeId': recipeId,
        'utensil': utensil,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Inserta los ingredientes de la receta en la tabla de ingredientes de recetas
  for (var ingredient in recipe.ingredients) {
    await db.insert(
      'recipe_ingredients',
      {
        'recipeId': recipeId,
        'ingredientId': ingredient.id,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  return recipeId;
}
  */

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

/*
Future<RecipeNew?> getRecipe(int id) async {
  final db = await database;

  // Recupera la receta de la tabla de recetas
  final recipeMap = await db.query(
    'recipes',
    where: 'id = ?',
    whereArgs: [id],
  );

  if (recipeMap.isEmpty) return null;

  // Obtén el ID del creador de la receta
  //int userCreatorId = recipeMap.first['userCreatorId'] as int;

  // Recupera el usuario usando el ID
  /*
  final userMap = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [userCreatorId],
  );
  */

  /*
  // Recupera el creador de la receta asociado
  final userMap = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [recipeMap.first['userCreator']],
  );
  */

  // Recupera los utensilios asociados a la receta
  final utensilMaps = await db.query(
    'recipe_utensils',
    where: 'recipeId = ?',
    whereArgs: [id],
  );

  // Recupera los ingredientes asociados a la receta
  final ingredientMaps = await db.query(
    'recipe_ingredients',
    where: 'recipeId = ?',
    whereArgs: [id],
  );

  // Crea los objetos correspondientes
  //UserNew user = UserNew.fromMap(userMap.first);
  List<String> utensils = utensilMaps.map((map) => map['utensil'] as String).toList();
  List<IngredientNew> ingredients = ingredientMaps.map((map) {
    // Aquí deberías buscar el ingrediente en la tabla `ingredients`
    return IngredientNew.fromMap(map);
  }).toList();

  // Crea el objeto RecipeNew
  RecipeNew recipe = RecipeNew(
    name: recipeMap.first['name'] as String,
    ingredients: ingredients,
    utensils: utensils,
    preparation: recipeMap.first['preparation'] as String,
    //userCreator: user,
    imageUrl: recipeMap.first['imageUrl'] as String,
    //rating: (recipeMap.first['rating'] as num).toDouble(),
    registrationDate: DateTime.parse(recipeMap.first['registrationDate'] as String),
    preparationTime: recipeMap.first['preparationTime'] as int,
  );

  return recipe;
}
*/

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

/*
Future<List<RecipeNew>> getAllRecipes() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('recipes');

  return List.generate(maps.length, (i) {
    return RecipeNew(
      name: maps[i]['name'],
      ingredients: [], // Asigna según tu estructura de datos
      utensils: [], // Asigna según tu estructura de datos
      preparation: maps[i]['preparation'],
      /*
      userCreator: UserNew(
        
        name: maps[i]['userCreator'],
        email: maps[i]["imprimansuenio@gmail.com"],
        biography: maps[i]["Amo el cafe"],
        typeOfExperienceWithCoffee: maps[i]["Consumidor"],
        age: maps[i][24],
        genre: maps[i]["Masculino"],
        bornData: maps[i][DateTime(2000,5,6)],
        createdRecipe: maps[i][[]],
        purshasedProducts: maps[i][[]],
        favoritesRecipes: maps[i][[]],
        favoritedPreparationMetods: maps[i][[]],
        favoritesProducts: maps[i][[]],
        favoritesIngredient: maps[i][[]],
        history: maps[i][[]],
        country: maps[i]["EE.UU"],
        region: maps[i]["Ohio"],
        city: maps[i]["Colombus"],
        profileURL: maps[i][''],
        registrationDate: maps[i][DateTime(2009,4,10)],
      ),
      */
      imageUrl: maps[i]['imageUrl'],
      //rating: maps[i]['rating'],
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
      /*
      ingredients: List<IngredientNew>.from(item['ingredients'].map((ingredient) => 
      IngredientNew(
          type: '',
          value: 1,
          ubication: "",
          //rating: 0.0,
          imageOfIngredient: '',
      
      ))),
      */
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

  /*
  //tienda y sus productos
  Future<int> insertShop(ShopNew shop) async {
    final db = await database;

    // Inserta la tienda en la tabla de tiendas
    int shopId = await db.insert(
      'shops',
      shop.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Inserta cada producto en la tabla de productos con referencia a shopId
    for (var product in shop.products) {
      await db.insert(
        'products',
        product.toMap()..['shopId'] = shopId,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return shopId;
  }

  Future<ShopNew?> getShop(int id) async {
    final db = await database;

    // Recupera la tienda de la tabla de tiendas
    final shopMap = await db.query(
      'shops',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (shopMap.isEmpty) return null;

    // Recupera los productos asociados a la tienda usando shopId
    final productMaps = await db.query(
      'products',
      where: 'shopId = ?',
      whereArgs: [id],
    );

    // Convierte los datos del mapa a objetos ProductNew
    List<ProductNew> products = productMaps.map((map) => ProductNew.fromMap(map)).toList();

    // Crea y retorna el objeto ShopNew
    return ShopNew.fromMap(shopMap.first)..products = products;
  }
  */

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