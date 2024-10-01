import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Buscar cafés o marcas...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              Center(
                child: Text(
                  'Resultados de búsqueda'
                  )
                ),
            ],
          ),
        ),
      ],
    );
  }
}

