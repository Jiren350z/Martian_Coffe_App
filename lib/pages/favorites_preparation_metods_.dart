import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';

class PreparationMethodListWidget extends StatelessWidget {
  final List<PreparationMetodNew> methods;

  const PreparationMethodListWidget({super.key, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Métodos de Preparación Favoritos')),
      body: ListView.builder(
        itemCount: methods.length,
        itemBuilder: (context, index) {
          final method = methods[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    method.imageOfMetod,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error al cargar la imagen');
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    method.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < method.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      );
                    }),
                  ),
                  const SizedBox(height: 5),
                  Text('Tiempo de Preparación: ${method.preparationTime} minutos'),
                  Text('Temperatura del Agua: ${method.waterTemperature} °C'),
                  Text('Dificultad: ${method.dificulty}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}