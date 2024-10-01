import 'package:martian_cofee_app/models/users_class.dart';

class ProductNew {
  String name;
  int id;
  double price;
  String description;
  int stock;
  String contact;
  UserNew userCreator;
  String imageOfProduct;  
  double rating;    

  

  ProductNew({
    required this.name,
    required this.id,
    required this.price,
    required this.description,
    required this.stock,
    required this.contact,
    required this.userCreator,
    required this.imageOfProduct,
    required this.rating,
  });

  void sell() {

  }

  void contactSeller() {
 
  }

  void demand() {

  }
}
