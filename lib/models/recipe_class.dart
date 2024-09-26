import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';

class RecipeNew {
  String name;
  List<IngredientNew> ingredients;
  List<String> utensils;
  UserNew userCreator;

  RecipeNew({
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.userCreator,
  });

  void save() {
    
  }

  void create() {
    
  }
}