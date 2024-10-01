

class PreparationMetodNew
{
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

  void prepare() {
    
  }

  double calculateProportionWaterCoffee() {

    double proportion = 0.0;
    return proportion;
  }

  void adjustTimeOfPreparation(int newTime) {
   
  }

  void adjustGrindingThickness(String nuevoGrosor) {
    
  }

  String recomendTypeOfCoffee() {
    
    return " ";
  }
  
  String recomendationOfGrind() {
    return " ";
  }
  
}