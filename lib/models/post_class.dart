import 'package:martian_cofee_app/models/coffee_mark_class.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';

class PostNew {
  UserNew userName;
  UserNew userNationality;
  String pubType; 
  ProductNew product; 
  RecipeNew recipe; 
  IngredientNew ingredient; 
  PreparationMetodNew preparationMetod; 
  CoffeeMarkNew coffeeMark; 
  String image; 
  String statement;
  DateTime publicDate;

  PostNew({
    required this.userName,
    required this.userNationality,
    required this.pubType,
    required this.product,
    required this.recipe,
    required this.ingredient,
    required this.preparationMetod,
    required this.coffeeMark,
    required this.image,
    required this.statement,
    required this.publicDate,
  });

  void blockUser() {
    // Implementar lógica para bloquear usuario
  }

  void reportPublication() {
    // Implementar lógica para reportar publicación
  }

  void cancel() {
    // Implementar lógica para cancelar la acción
  }

  void public() {
    // Implementar lógica para publicar
  }

  void coment() {
    // Implementar lógica para comentar
  }

  void share() {
    // Implementar lógica para compartir
  }

  void addToFavorites() {
    // Implementar lógica para añadir a favoritos
  }
}