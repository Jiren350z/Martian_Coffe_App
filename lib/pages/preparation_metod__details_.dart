import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/pages/rate_.dart';

class PreparationMethodDetailPage extends StatefulWidget {
  final PreparationMetodNew preparationMethod;

  const PreparationMethodDetailPage({super.key, required this.preparationMethod});

  @override
  PreparationMethodDetailPageState createState() => PreparationMethodDetailPageState();
}

class PreparationMethodDetailPageState extends State<PreparationMethodDetailPage> {
  bool isFavorite = false; 
  int userRating = 0;

  final TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.preparationMethod.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset(
                widget.preparationMethod.imageOfMetod,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
              // Título del método
              Text(
                widget.preparationMethod.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Calificación del método
              Row(
                children: [
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < widget.preparationMethod.rating
                            ? Icons.star
                            : Icons.star_border,
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
                        recipeName: widget.preparationMethod.name,
                        //category: 'Producto', // Pasa la categoría adecuada
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
              // Descripción
              const Text(
                'Descripción:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.preparationMethod.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Tiempo de preparación
              Row(
                children: [
                  const Text(
                    'Tiempo de preparación: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.preparationMethod.preparationTime} minutos',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              // Temperatura y cantidad de agua
              Row(
                children: [
                  const Text(
                    'Temperatura del agua: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.preparationMethod.waterTemperature}°C',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Cantidad de agua: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.preparationMethod.waterAmount} ml',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              // Cantidad de café
              Row(
                children: [
                  const Text(
                    'Cantidad de café: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.preparationMethod.coffeeAmount} g',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              // Grosor de molienda
              Row(
                children: [
                  const Text(
                    'Grosor de molienda: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.preparationMethod.grindingThickness,
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              // Equipos necesarios
              const Text(
                'Equipos necesarios:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.preparationMethod.equipment.map((item) {
                  return Text('- $item', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),

              // Notas de sabor
              const Text(
                'Notas de sabor:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.preparationMethod.flavorNotes.map((note) {
                  return Text('- $note', style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
              const SizedBox(height: 10),

              // Dificultad
              Row(
                children: [
                  const Text(
                    'Dificultad: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.preparationMethod.dificulty,
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),

              // Tipo de filtro
              Row(
                children: [
                  const Text(
                    'Tipo de filtro: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.preparationMethod.filterType,
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              // Recomendaciones
              const Text(
                'Recomendaciones:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.preparationMethod.recomendations,
                style: const TextStyle(fontSize: 16),
              ),
              
              const SizedBox(height: 50),
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