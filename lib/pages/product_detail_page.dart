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
      body: SingleChildScrollView( // Envolver el contenido en un SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/caffe_mokka.jpg',
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
                        color: Colors.yellow,
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
                  widget.product.description, // Asegúrate de que `ProductNew` tenga esta propiedad
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                // Precio del producto
                Text('Precio: \$${widget.product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 10),
                // Precio del producto
                Text('Stock: \$${widget.product.stock.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                // Precio del producto
                Text('Contacto: \$${widget.product.contact}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                // Nombre del vendedor
                Text('Vendedor: ${widget.product.userCreator.name}', style: const TextStyle(fontSize: 16)),
                
                const SizedBox(height: 10.0),
                // Botón para comprar (ancho completo)
                ElevatedButton(
                  onPressed: () {
                    // Funcionalidad para comprar
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

/*
class ProductWidgetState extends State<ProductWidget> {
  bool isFavorite = false; // Para controlar el estado del ícono de favoritos
  int userRating = 0;

  final TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Image.asset(
              'assets/images/caffe_mokka.jpg', // Actualiza con la ruta de la imagen del producto
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error al cargar la imagen');
              },
            ),
            const SizedBox(height: 5),
            // Fila para estrellas y el ícono de favoritos
            Row(
              children: [
                // Mostrar las estrellas (puedes ajustar esto según el rating del producto)
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < userRating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 30,
                    );
                  }),
                ),
                const SizedBox(width: 10),
                // Ícono de corazón para favoritos
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
                // Botón para compartir
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Funcionalidad de compartir
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Botón para calificar
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RatingPage(
                      initialRating: userRating,
                      recipeName: widget.product.name, // Cambia esto según lo que necesites
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
            // Descripción del producto
            const Text('Descripción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              widget.product.description, // Asegúrate de que `ProductNew` tenga esta propiedad
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Precio del producto
            Text('Precio: \$${widget.product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 10),
            // Precio del producto
            Text('Stock: \$${widget.product.stock.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            // Precio del producto
            Text('Contacto: \$${widget.product.contact}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            // Nombre del vendedor
            Text('Vendedor: ${widget.product.userCreator.name}', style: const TextStyle(fontSize: 16)),
            
            const SizedBox(height: 10.0),
            // Botón para comprar (ancho completo)
            ElevatedButton(
              onPressed: () {
                // Funcionalidad para comprar
              },

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Ancho completo y altura personalizada
              ),
              child: const Text('Comprar'),
            ),
            
            const SizedBox(height: 20),
            // Campo para agregar comentarios
            TextField(
              controller: comment,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Fondo claro
                hintText: 'Escribe un comentario...',
                hintStyle: TextStyle(color: Colors.grey[600]), // Estilo del hint
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Espaciado interno
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin bordes visibles
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor), // Icono de enviar
                  onPressed: () {
                    // Funcionalidad para enviar el comentario
                    // print('Comentario enviado: ${comment.text}');
                    // comment.clear(); // Limpiar el campo de texto después de enviar
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),


       
          ],
        ),
      ),
    );
  }
}
*/
/*
class ProductWidget extends StatelessWidget {
  final ProductNew product;

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
                  image: AssetImage('assets/images/caffe_mokka.jpg'), // Asegúrate de tener la imagen en la carpeta assets
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
            
          ],
        ),
      ),
    );
  }
}
*/