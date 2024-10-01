import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/pages/rate_.dart';

class ProductWidget extends StatefulWidget {
  final ProductNew product;

  const ProductWidget({super.key, required this.product});

  @override
  ProductWidgetState createState() => ProductWidgetState();
}

class ProductWidgetState extends State<ProductWidget> {
  bool isFavorite = false;
  int userRating = 0;

  final TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.product.imageOfProduct,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < widget.product.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingPage(
                        initialRating: userRating,
                        recipeName: widget.product.name,
                        category: 'Producto', // Pasa la categoría adecuada
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      userRating = result;
                    });
                  }
                },
                child: const Text('Calificar'),
              ),
              const SizedBox(height: 10),

              const Text('Descripción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  widget.product.description, 
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                //precio del producto
                Text('Precio: \$${widget.product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                //stock del producto
                Text('Stock: ${widget.product.stock.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                //contacto
                Text('Contacto: ${widget.product.contact}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                //nombre del vendedor
                Text('Vendedor: ${widget.product.userCreator.name}', style: const TextStyle(fontSize: 16)),
                
                const SizedBox(height: 10.0),
                
                ElevatedButton(
                  onPressed: () {
 
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50), // Ancho completo y altura personalizada
                  ),
                  child: const Text('Comprar'),
                ),
                
              const SizedBox(height: 100),
              TextField(
                controller: comment,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Escribe un comentario...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

