import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';

class RecipeNew {
  String name;
  List<IngredientNew> ingredients;
  List<String> utensils;
  String preparation;
  UserNew userCreator;
  String imageUrl;  
  double rating;  

  RecipeNew({
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.preparation,
    required this.userCreator,
    required this.imageUrl, 
    required this.rating,  
  });

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