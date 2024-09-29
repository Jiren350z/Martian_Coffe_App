import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  
  final String userName;
  final String userEmail;

  const HelpScreen({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayuda"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre: $userName",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Email: $userEmail",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const Text(
              "¿Necesitas ayuda? Escríbenos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Escribe tu mensaje aquí",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica de envío (solo visual)
                },
                child: const Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}