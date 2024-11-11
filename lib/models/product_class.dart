//import 'package:martian_cofee_app/models/users_class.dart';

class ProductNew {
  String name;
  int id;
  double price;
  String description;
  int stock;
  String contact;
  //UserNew userCreator;
  String imageOfProduct;  
  double rating;    

  

  ProductNew({
    required this.name,
    required this.id,
    required this.price,
    required this.description,
    required this.stock,
    required this.contact,
    //required this.userCreator,
    required this.imageOfProduct,
    required this.rating,
  });

  // Convert ProductNew to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'price': price,
      'description': description,
      'stock': stock,
      'contact': contact,
      //'userCreator': userCreator.toMap(),
      'imageOfProduct': imageOfProduct,
      'rating': rating,
    };
  }

  // Create ProductNew from Map
  factory ProductNew.fromMap(Map<String, dynamic> map) {
    return ProductNew(
      name: map['name'],
      id: map['id'],
      price: map['price'],
      description: map['description'],
      stock: map['stock'],
      contact: map['contact'],
      //userCreator: UserNew.fromMap(map['userCreator']),
      imageOfProduct: map['imageOfProduct'],
      rating: map['rating'],
    );
  }

  void sell() {

  }

  void contactSeller() {
 
  }

  void demand() {

  }
}
