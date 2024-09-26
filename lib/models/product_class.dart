import 'package:martian_cofee_app/models/users_class.dart';

class ProductNew {
  String name;
  int id;
  double price;
  UserNew userCreator;

  ProductNew({
    required this.name,
    required this.id,
    required this.price,
    required this.userCreator,
  });

  void sell() {
    // Lógica para vender producto
  }

  void contactSeller() {
    // Lógica para contactar al creador del producto
  }

  void demand() {
    // Lógica para generar demanda de este producto
  }
}
