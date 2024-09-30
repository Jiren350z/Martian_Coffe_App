

class PreparationMetodNew
{
  String name;
  String description;
  int preparationTime; // En minutos
  double waterTemperature; // En grados Celsius
  double waterAmount; // En ml
  double coffeeAmount; // En gramos
  String grindingThickness; // E.g., grueso, medio, fino
  List<String> equipment; // Lista de herramientas necesarias
  List<String> flavorNotes; // E.g., afrutado, achocolatado
  String dificulty; // E.g., fácil, medio, difícil
  String filterType; // E.g., filtro de papel, metal
  String recomendations; // Recomendaciones adicionales
  double rating; 
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