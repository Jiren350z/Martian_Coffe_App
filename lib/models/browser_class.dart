import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';

class SearchableItem {
  final String name;
  final String description;
  final String image;
  final bool isProduct;
  final bool isPost;
  final String? postType; // 'Receta', 'Ingrediente', etc.
  final ProductNew? product; // Solo para productos
  final RecipeNew? recipe; // Solo si es receta
  final IngredientNew? ingredient; // Solo si es ingrediente
  
  SearchableItem({
    required this.name,
    required this.description,
    required this.image,
    this.isProduct = false,
    this.isPost = false,
    this.postType,
    this.product,
    this.recipe,
    this.ingredient,
  });
}

/*
class SearchableItem {
  
  final String name;
  final String description;
  final String image;
  final bool isProduct; // Para distinguir entre productos y publicaciones

  SearchableItem({
    required this.name,
    required this.description,
    required this.image,
    required this.isProduct,
  });
}*/