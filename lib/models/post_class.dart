import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';
//import 'package:martian_cofee_app/models/product_class.dart';
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