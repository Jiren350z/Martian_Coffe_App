
import 'package:martian_cofee_app/models/product_class.dart';

class ShopNew {

  String name;
  List<ProductNew> products;
  List<String> payMetods;
  

  ShopNew({
    required this.name,
    required this.products,
    required this.payMetods,
  });

    // Convert ShopNew to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'products': products.map((product) => product.toMap()).toList(),
      'payMethods': payMetods,
    };
  }

  // Create ShopNew from Map
  factory ShopNew.fromMap(Map<String, dynamic> map) {
    return ShopNew(
      name: map['name'],
      products: (map['products'] as List)
          .map((product) => ProductNew.fromMap(product))
          .toList(),
      payMetods: List<String>.from(map['payMethods']),
    );
  }

  void addProduct() {
    
  }


  void searchProduct() {
    
  }

  void buyProduct() {
    
  }

  void showDetailsOfProduct() {
    
  }

} 
