//import 'dart:convert';

//import 'package:martian_cofee_app/models/ingredient_class.dart';
//import 'package:martian_cofee_app/models/users_class.dart';

class RecipeNew {
  String name;
  List<String> ingredients;
  List<String> utensils;
  String preparation;
  //UserNew userCreator;
  String imageUrl;  
  //double rating;
  DateTime registrationDate;
  int preparationTime;  


  RecipeNew({
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.preparation,
    //required this.userCreator,
    required this.imageUrl, 
    //required this.rating, 
    required this.registrationDate, 
    required this.preparationTime,
  });

  // Convert RecipeNew to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      //'ingredients': jsonEncode(ingredients.map((i) => i.toMap()).toList()),
      'ingredients': ingredients.join(','),
      //'ingredients': ingredients.map((ingredient) => ingredient.toMap()).toList(),
      'utensils': utensils.join(','),
      //'utensils': utensils,
      //'utensils': jsonEncode(utensils),
      'preparation': preparation,
      //'userCreator': jsonEncode(userCreator.toMap()),
      //'userCreatorId': userCreator.id, // Solo el ID del usuario
      //'userCreator': userCreator.toMap(),
      'imageUrl': imageUrl,
      //'rating': rating,
      'registrationDate': registrationDate.toIso8601String(),
      'preparationTime' : preparationTime,
    };
  }

  factory RecipeNew.fromMap(Map<String, dynamic> map) {
  return RecipeNew(
    name: map['name'],
    ingredients: map['ingredients'],
    /*
    ingredients: (map['ingredients'] as List)
        .map((ingredient) => IngredientNew.fromMap(ingredient))
        .toList(),
    */    
    utensils: List<String>.from(map['utensils']),
    preparation: map['preparation'],
    //userCreator: user,
    imageUrl: map['imageUrl'],
    //rating: map['rating'],
    registrationDate: DateTime.parse(map['registrationDate']),
    preparationTime: map['preparationTime'],
  );
}

  /*
  // Create RecipeNew from Map
  factory RecipeNew.fromMap(Map<String, dynamic> map) {
    return RecipeNew(
      name: map['name'],
      ingredients: (map['ingredients'] as List)
          .map((ingredient) => IngredientNew.fromMap(ingredient))
          .toList(),
      utensils: List<String>.from(map['utensils']),
      preparation: map['preparation'],
      userCreator: UserNew.fromMap(map['userCreator']),
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      registrationDate: DateTime.parse(map['registrationDate']),
    );
  }
  */

  void save() {
    
  }

  void create() {
    
  }

  void rateRecipe()
  {

  }

  void shareRecipe()
  {
    
  }


}