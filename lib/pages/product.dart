import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/users.dart';

class Product {
  String name;
  int id;
  double price;
  User userCreator;

  Product({
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


class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen de fondo del producto
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/product_image.png'), // Asegúrate de tener la imagen en la carpeta assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Título del producto
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            // Id del producto
            Text('ID: ${product.id}'),
            const SizedBox(height: 10.0),
            // Precio del producto
            Text('Precio: \$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 10.0),
            // Nombre del usuario creador
            Text('Vendedor: ${product.userCreator.name}'),
            const Spacer(),
            // Botón para regresar al menú principal
            ElevatedButton(
              onPressed: () {
                // Navegar de vuelta a la pantalla principal
                Navigator.of(context).pop(); // Esto te regresa a la pantalla anterior (puedes ajustarlo según tu flujo)
              },
              child: const Text('Volver al Menú Principal'),
            ),
          ],
        ),
      ),
    );
  }
}
