import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';

class UserNew {
  String name;
  String email;
  String biography;
  int age;
  String genre;
  DateTime bornData;
  String typeOfExperienceWithCoffee;
  List<RecipeNew> createdRecipe;
  List<ProductNew> purshasedProducts;
  List<RecipeNew> favoritesRecipes;
  List<PreparationMetodNew> favoritedPreparationMetods;
  List<ProductNew> favoritesProducts;
  List<IngredientNew> favoritesIngredient;
  List<String> history;
  String country;
  String region;
  String city;
  String profileURL;

  UserNew({
    required this.name,
    required this.email,
    required this.biography,
    required this.typeOfExperienceWithCoffee,
    required this.age,
    required this.genre,
    required this.bornData,
    required this.createdRecipe,
    required this.purshasedProducts,
    required this.favoritesRecipes,
    required this.favoritedPreparationMetods,
    required this.favoritesProducts,
    required this.favoritesIngredient,
    required this.history,
    required this.country,
    required this.region,
    required this.city,
    required this.profileURL, required registrationDate,
  });

  // Convert UserNew to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'biography': biography,
      'age': age,
      'genre': genre,
      'bornData': bornData.toIso8601String(),
      'typeOfExperienceWithCoffee': typeOfExperienceWithCoffee,
      'createdRecipe': createdRecipe.map((recipe) => recipe.toMap()).toList(),
      'purchasedProducts': purshasedProducts.map((product) => product.toMap()).toList(),
      'favoritesRecipes': favoritesRecipes.map((recipe) => recipe.toMap()).toList(),
      'favoritedPreparationMethods': favoritedPreparationMetods.map((method) => method.toMap()).toList(),
      'favoritesProducts': favoritesProducts.map((product) => product.toMap()).toList(),
      'favoritesIngredient': favoritesIngredient.map((ingredient) => ingredient.toMap()).toList(),
      'history': history,
      'country': country,
      'region': region,
      'city': city,
      'profileURL': profileURL,
    };
  }

  // Create UserNew from Map
  factory UserNew.fromMap(Map<String, dynamic> map) {
    return UserNew(
      name: map['name'],
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
    );
  }

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

   void addPreparationMetodsToFavorites(PreparationMetodNew preparationMethod) {
    favoritedPreparationMetods.add(preparationMethod);
  }
   void addIngredientToFavorites(IngredientNew ingredient) {
    favoritesIngredient.add(ingredient);
  }



}