import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/pages/product_detail_page.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductNew> products;

  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos Favoritos')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];          
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            
            child: InkWell(   
              onTap: () {
                // navegar a la pagina de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductWidget(product: product),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product.imageOfProduct,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < product.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    const SizedBox(height: 5),
                    Text('Precio: \$${product.price.toStringAsFixed(2)}'),
                    //Text('Descripción: ${product.description}'),
                    Text('Stock: ${product.stock}'),
                  ],
                ),                
              ),          
            ),  
          );
        },
      ),
    );
  }
}