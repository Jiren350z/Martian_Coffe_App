import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';

class RecipeNew {
  String name;
  List<IngredientNew> ingredients;
  List<String> utensils;
  UserNew userCreator;
  String imageUrl;  // Nuevo atributo para la URL de la imagen
  double rating;     // Nuevo atributo para la valoración (0.0 a 5.0)

  RecipeNew({
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.userCreator,
    required this.imageUrl,  // Asegúrate de que esté incluido en el constructor
    required this.rating,     // Asegúrate de que esté incluido en el constructor
  });

  void save() {
    
  }

  void create() {
    
  }

  void rateRecipe()
  {

  }

}