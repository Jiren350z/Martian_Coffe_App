//import 'package:martian_cofee_app/models/product_class.dart';

class IngredientNew {
  String type;
  double value;
  String ubication;
  double rating;
  String imageOfIngredient; 

  IngredientNew({
    required this.type,
    required this.value,
    required this.ubication,
    required this.rating,
    required this.imageOfIngredient,
  });

  get id => null;

    Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
      'ubication': ubication,
      'rating': rating,
      'imageOfIngredient': imageOfIngredient,
    };
  }

  static IngredientNew fromMap(Map<String, dynamic> map) {
    return IngredientNew(
      type: map['type'],
      value: map['value'],
      ubication: map['ubication'],
      rating: map['rating'],
      imageOfIngredient: map['imageOfIngredient'],
    );
  }


  void lookUbication() {

  }
}