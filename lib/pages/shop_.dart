import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/shop_class.dart';
import 'package:martian_cofee_app/pages/product_detail_page.dart';


class ShopWidget extends StatelessWidget {
  final ShopNew shop;

  const ShopWidget({super.key,required this.shop});

  @override
  Widget build(BuildContext context) {
    // Productos
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: ListView.builder(
        itemCount: shop.products.length,
        itemBuilder: (context, index) {
          final product = shop.products[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.asset(
                product.imageOfProduct,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Precio: \$${product.price}', style: const TextStyle(color: Colors.green)),
                  Text('Stock: ${product.stock}'),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < product.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      );
                    }),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navegar a la página de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductWidget(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para agregar una publicación
        },
        backgroundColor: const Color.fromARGB(255, 234, 227, 10),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  
}