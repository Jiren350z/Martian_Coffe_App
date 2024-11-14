

class RecipeNew {
  int? id;
  String name;
  List<String> ingredients;
  List<String> utensils;
  String preparation;
  String imageUrl;  
  DateTime registrationDate;
  int preparationTime;  
  bool isAssetImage;
  List<String> products; // Lista de productos
  int preparationCounter; // Contador de preparación

  RecipeNew({
    this.id,
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.preparation,
    required this.imageUrl, 
    required this.registrationDate, 
    required this.preparationTime,
    required this.products, // Ahora es requerido
    required this.preparationCounter, // Ahora es requerido
    this.isAssetImage = false,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'name': name,
      'ingredients': ingredients.join(','),
      'utensils': utensils.join(','),
      'preparation': preparation,
      'imageUrl': imageUrl,
      'registrationDate': registrationDate.toIso8601String(),
      'preparationTime': preparationTime,
      'products': products.join(','), // Convertir productos a String
      'preparationCounter': preparationCounter,
    };
    if (id != null) {
      map['id'] = id as Object;  // Incluir id solo si existe
    }
    return map;
  }

  
  factory RecipeNew.fromMap(Map<String, dynamic> map) {
  return RecipeNew(
    id: map['id'] as int?, 
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


}