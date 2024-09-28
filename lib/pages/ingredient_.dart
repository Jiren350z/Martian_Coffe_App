import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';

class IngredientWidget extends StatelessWidget {
  final IngredientNew ingredient;

  const IngredientWidget({super.key,required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Ingrediente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostramos el tipo de ingrediente
            Text(
              'Tipo: ${ingredient.type}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Mostramos el valor del ingrediente
            Text(
              'Valor: ${ingredient.value.toStringAsFixed(2)}', // Convertimos el double a un string con 2 decimales
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            // Mostramos la ubicación del ingrediente
            Text(
              'Ubicación: ${ingredient.ubication}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Botón para buscar la ubicación del ingrediente
            ElevatedButton(
              onPressed: () {
                ingredient.lookUbication();
                // Aquí puedes incluir más lógica relacionada con la ubicación
              },
              child: const Text('Buscar Ubicación'),
            ),
            const SizedBox(height: 20),
            // Botón para regresar al menú principal
            /*
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Volver al Menú Principal'),
            ),
            */
          ],
        ),
      ),
    );
  }
}

