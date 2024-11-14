//import 'dart:convert';

//import 'package:martian_cofee_app/models/ingredient_class.dart';
//import 'package:martian_cofee_app/models/users_class.dart';

class RecipeNew {
  int id;
  String name;
  List<String> ingredients;
  List<String> utensils;
  String preparation;
  //UserNew userCreator;
  String imageUrl;  
  //double rating;
  DateTime registrationDate;
  int preparationTime;  
  bool isAssetImage;
  List<String> products; // Lista de productos
  int preparationCounter; // Contador de preparación

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
    required this.products, // Ahora es requerido
    required this.preparationCounter, // Ahora es requerido
    this.isAssetImage = false,
  });

  // Convert RecipeNew to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ingredients': ingredients.join(','),
      'utensils': utensils.join(','),
      'preparation': preparation,
      'imageUrl': imageUrl,
      'registrationDate': registrationDate.toIso8601String(),
      'preparationTime' : preparationTime,
      'products': products.join(','), // Convertir productos a String
      'preparationCounter': preparationCounter,
    };
  }

  factory RecipeNew.fromMap(Map<String, dynamic> map) {
  return RecipeNew(
    name: map['name'],
    ingredients: map['ingredients'],   
    utensils: List<String>.from(map['utensils']),
    preparation: map['preparation'],
    imageUrl: map['imageUrl'],
    registrationDate: DateTime.parse(map['registrationDate']),
    preparationTime: map['preparationTime'],
    products: List<String>.from(map['products'].split(',')), // Convertir String a lista
    preparationCounter: map['preparationCounter'] ?? 0,
  );
}

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