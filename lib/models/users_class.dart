import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';

class UserNew {
  String name;
  String email;
  List<RecipeNew> createdRecipe;
  //List<PreparationMetodsNew> createdPreparationMetods
  List<ProductNew> purshasedProducts;
  List<RecipeNew> favoritesRecipes;
  //List<PreparationMetodsNew> favoritedPreparationMetods
  List<ProductNew> favoritesProducts;
  //List<CoffeeBrand> favoritesCoffeeBrands
  List<String> history;
  String country;

  UserNew({
    required this.name,
    required this.email,
    required this.createdRecipe,
    required this.purshasedProducts,
    required this.favoritesRecipes,
    required this.favoritesProducts,
    required this.history,
    required this.country
  });

  void rateRecipe(RecipeNew recipe, int calification) {
    
  }

   void rateProduct(ProductNew product, int calification) {
    
  }

  void addRecipeToFavorites(RecipeNew recipe) {
    favoritesRecipes.add(recipe);
  }

  void addProductToFavorites(ProductNew product) {
    favoritesProducts.add(product);
  }

}