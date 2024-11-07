import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';
class PostNew {
  UserNew userData;
  String pubType;  
  RecipeNew recipe; 
  IngredientNew ingredient; 
  PreparationMetodNew preparationMetod; 
  //ProductNew productt;
  String image; 
  String statement;
  DateTime publicDate;

  PostNew({
    required this.userData,
    required this.pubType,
    required this.recipe,
    required this.ingredient,
    required this.preparationMetod,
    //required this.productt,
    required this.image,
    required this.statement,
    required this.publicDate,
  });

  String timeSincePublication() {
    final now = DateTime.now();
    final difference = now.difference(publicDate);

    if (difference.inDays > 0) {
      return "hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}";
    } else if (difference.inHours > 0) {
      return "hace ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}";
    } else if (difference.inMinutes > 0) {
      return "hace ${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''}";
    } else {
      return "hace un momento";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'userData': userData.name, // Esto puede ser un ID si lo tiene
      'pubType': pubType,
      'recipe': recipe.name,
      'ingredient': ingredient.type,
      'preparationMetod': preparationMetod.name,
      'image': image,
      'statement': statement,
      'publicDate': publicDate.toIso8601String(),
    };
  }

  static PostNew fromMap(Map<String, dynamic> map) {
    return PostNew(
      userData: UserNew(
        name: map['userData'],
        email: map['email'],
        biography: map['biography'],
        age: map['age'],
        genre: map['genre'],
        bornData: DateTime.parse(map['bornData']),
        typeOfExperienceWithCoffee: map['typeOfExperienceWithCoffee'],
        createdRecipe: (map['createdRecipe'] as List)
            .map((recipe) => RecipeNew.fromMap(recipe))
            .toList(),
        purshasedProducts: (map['purchasedProducts'] as List)
            .map((product) => ProductNew.fromMap(product))
            .toList(),
        favoritesRecipes: (map['favoritesRecipes'] as List)
            .map((recipe) => RecipeNew.fromMap(recipe))
            .toList(),
        favoritedPreparationMetods: (map['favoritedPreparationMethods'] as List)
            .map((method) => PreparationMetodNew.fromMap(method))
            .toList(),
        favoritesProducts: (map['favoritesProducts'] as List)
            .map((product) => ProductNew.fromMap(product))
            .toList(),
        favoritesIngredient: (map['favoritesIngredient'] as List)
            .map((ingredient) => IngredientNew.fromMap(ingredient))
            .toList(),
      history: List<String>.from(map['history']),
      country: map['country'],
      region: map['region'],
      city: map['city'],
      profileURL: map['profileURL'],
      registrationDate: DateTime.parse(map['registrationDate'])
      ), // Crear objeto UserNew con valores adecuados

      pubType: map['pubType'],
      recipe: RecipeNew(
        name: map['recipe'],
              ingredients: (map['ingredients'] as List)
          .map((ingredient) => IngredientNew.fromMap(ingredient))
          .toList(),
        utensils: List<String>.from(map['utensils']),
        preparation: map['preparation'],
        userCreator: UserNew.fromMap(map['userCreator']),
        imageUrl: map['imageUrl'],
        rating: map['rating'],
        registrationDate: DateTime.parse(map['registrationDate']),
      ), // Crear objeto RecipeNew con valores adecuados

      ingredient: IngredientNew(
        type: map['ingredient'],
        value: map['value'],
        ubication: map['ubication'],
        rating: map['rating'],
        imageOfIngredient: map['imageOfIngredient']
      ), // Crear objeto IngredientNew con valores adecuados

      preparationMetod: PreparationMetodNew(
        name: map['preparationMetod'],
        description: map['description'],
        preparationTime: map['preparationTime'],
        waterTemperature: map['waterTemperature'],
        waterAmount: map['waterAmount'],
        coffeeAmount: map['coffeeAmount'],
        grindingThickness: map['grindingThickness'],
        equipment: map['equipment'].split(','), // Deserialización
        flavorNotes: map['flavorNotes'].split(','), // Deserialización
        dificulty: map['dificulty'],
        filterType: map['filterType'],
        recomendations: map['recomendations'],
        rating: map['rating'],
        imageOfMetod: map['imageOfMetod'],          
      ), 
      // Crear objeto PreparationMetodNew con valores adecuados
      image: map['image'],
      statement: map['statement'],
      publicDate: DateTime.parse(map['publicDate']),
    );
  }

  void blockUser() {

  }

  void reportPublication() {

  }

  void cancel() {

  }

  void public() {

  }

  void coment() {
    
  }

  void share() {

  }

  void addToFavorites() {

  }
}