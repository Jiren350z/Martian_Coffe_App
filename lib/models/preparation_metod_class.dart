

class PreparationMetodNew{
  String name;
  String description;
  int preparationTime; 
  double waterTemperature; 
  double waterAmount; 
  double coffeeAmount; 
  String grindingThickness; 
  List<String> equipment; 
  List<String> flavorNotes; 
  String dificulty; 
  String filterType; 
  String recomendations; 
  double rating; 
  String imageOfMetod;

  PreparationMetodNew({
    required this.name,
    required this.description,
    required this.preparationTime,
    required this.waterTemperature,
    required this.waterAmount,
    required this.coffeeAmount,
    required this.grindingThickness,
    required this.equipment,
    required this.flavorNotes,
    required this.dificulty,
    required this.filterType,
    required this.recomendations,
    required this.rating,
    required this.imageOfMetod,
  });

   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'preparationTime': preparationTime,
      'waterTemperature': waterTemperature,
      'waterAmount': waterAmount,
      'coffeeAmount': coffeeAmount,
      'grindingThickness': grindingThickness,
      'equipment': equipment.join(','), // Serialización de lista
      'flavorNotes': flavorNotes.join(','), // Serialización de lista
      'dificulty': dificulty,
      'filterType': filterType,
      'recomendations': recomendations,
      'rating': rating,
      'imageOfMetod': imageOfMetod,
    };
  }

  static PreparationMetodNew fromMap(Map<String, dynamic> map) {
    return PreparationMetodNew(
      name: map['name'],
      description: map['description'],
      preparationTime: map['preparationTime'],
      waterTemperature: map['waterTemperature'],
      waterAmount: map['waterAmount'],
      coffeeAmount: map['coffeeAmount'],
      grindingThickness: map['grindingThickness'],
      equipment: map['equipment'].split(','), // Deserialización
      flavorNotes: map['flavorNotes'].split(','), // Deserialización
      dificulty: map['dificulty'],
      filterType: map['filterType'],
      recomendations: map['recomendations'],
      rating: map['rating'],
      imageOfMetod: map['imageOfMetod'],
    );
  }

  void prepare() {
    
  }

  double calculateProportionWaterCoffee() {

    double proportion = 0.0;
    return proportion;
  }

  void adjustTimeOfPreparation(int newTime) {
   
  }

  void adjustGrindingThickness(String newThickness) {
    
  }

  String recomendTypeOfCoffee() {
    
    return " ";
  }
  
  String recomendationOfGrind() {
    return " ";
  }
  
}