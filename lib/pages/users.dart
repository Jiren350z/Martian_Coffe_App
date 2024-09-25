import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/recipe.dart';
import 'package:martian_cofee_app/pages/product.dart';

class User {
  String name;
  String email;
  List<Recipe> createdRecipe;
  List<Product> purshasedProducts;
  List<Recipe> favorites;
  List<String> history;

  User({
    required this.name,
    required this.email,
    required this.createdRecipe,
    required this.purshasedProducts,
    required this.favorites,
    required this.history,
  });

  void rateRecipe(Recipe recipe, int calification) {
    // Lógica para calificar receta
  }

  void addToFavorites(Recipe recipe) {
    favorites.add(recipe);
  }
}

class UserScreen extends StatelessWidget {
  final User user;

  const UserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de ${user.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información del usuario
              Text(
                'Nombre: ${user.name}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${user.email}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Recetas creadas
              const Text(
                'Recetas Creadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildRecipeList(user.createdRecipe),
              const SizedBox(height: 20),
              // Productos comprados
              const Text(
                'Productos Comprados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildProductList(user.purshasedProducts),
              const SizedBox(height: 20),
              // Favoritos
              const Text(
                'Recetas Favoritas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildRecipeList(user.favorites),
              const SizedBox(height: 20),
              // Historial
              const Text(
                'Historial:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildHistoryList(user.history),
              const SizedBox(height: 20),
              // Botón para volver al menú principal
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar de vuelta a la pantalla principal
                    Navigator.of(context).pop(); 
                  },
                  child: const Text('Volver al Menú Principal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Lista de recetas creadas y favoritas
  Widget _buildRecipeList(List<Recipe> recipes) {
    return ListView.builder(
      shrinkWrap: true, // Para evitar problemas con el scroll dentro de SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // No permitir el scroll individual aquí
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(recipes[index].name),
          subtitle: Text('Calificacion: ${recipes[index].name.toString()}'),//solucionar esto
        );
      },
    );
  }

  // Lista de productos comprados
  Widget _buildProductList(List<Product> products) {
    return ListView.builder(
      shrinkWrap: true, // Para evitar problemas con el scroll dentro de SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // No permitir el scroll individual aquí
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('Precio: \$${products[index].price.toStringAsFixed(2)}'),
        );
      },
    );
  }

  // Lista de historial
  Widget _buildHistoryList(List<String> history) {
    return ListView.builder(
      shrinkWrap: true, // Para evitar problemas con el scroll dentro de SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // No permitir el scroll individual aquí
      itemCount: history.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(history[index]),
        );
      },
    );
  }
}