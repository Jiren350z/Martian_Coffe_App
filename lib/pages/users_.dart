import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/users_class.dart';
//import 'package:martian_cofee_app/pages/product_.dart';
//import 'package:martian_cofee_app/pages/recipe_.dart';
import 'package:martian_cofee_app/pages/settings_.dart';

/*
class UserNew {
  String name;
  String email;
  List<RecipeNew> createdRecipe;
  //List<PreparationMetodsNew> createdPreparationMetods
  List<ProductNew> purshasedProducts;
  List<RecipeNew> favoritesRecipes;
  //List<PreparationMetodsNew> favoritedPreparationMetods
  List<ProductNew> favoritesProducts;
  //List<CoffeeBrand> favoritesCoffeeBrands
  List<String> history;
  String country;

  UserNew({
    required this.name,
    required this.email,
    required this.createdRecipe,
    required this.purshasedProducts,
    required this.favoritesRecipes,
    required this.favoritesProducts,
    required this.history,
    required this.country
  });

  void rateRecipe(RecipeNew recipe, int calification) {
    
  }

   void rateProduct(ProductNew product, int calification) {
    
  }

  void addRecipeToFavorites(RecipeNew recipe) {
    favoritesRecipes.add(recipe);
  }

  void addProductToFavorites(ProductNew product) {
    favoritesProducts.add(product);
  }

}
*/
class UserScreen extends StatelessWidget {
  final UserNew user;

  const UserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Lógica para el ícono de mensajes
                    },
                    child: const Icon(
                      Icons.message,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Lógica para el ícono de notificaciones
                    },
                    child: const Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(
                            userName: user.name,
                            userEmail: user.email,
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Espaciado para la imagen de perfil

              Center(
                child: Column(
                  children: [
                    // Imagen de perfil circular
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://example.com/user-profile.jpg', // Cambia por tu imagen
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Nombre del usuario
                    Text(
                      user.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Nacionalidad con la bandera
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flag), // Coloca un ícono o imagen de la bandera
                        const SizedBox(width: 5),
                        Text(user.country),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // GridView para las cards
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2, //largo
                childAspectRatio: 1.7, // ancho
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(), // Evitar scroll independiente
                children: [
                  _buildCard('Publicaciones', '0'), // Información de ejemplo
                  _buildCard('Cafés Favoritos', '0'),
                  _buildCard('Marcas de Café Favoritos', '0'),
                  _buildCard('Productos Favoritos', '0'),
                  _buildCard('Recetas Favoritas', '0'),
                  _buildCard('Recetas Creadas', '0'),
                  _buildCard('Métodos de Preparación Favoritos', '0'),
                  _buildCard('Métodos de Preparación Creados', '0'),
                ],
              ),
              const SizedBox(height: 20),
              // Apartado para accesorios y máquinas
              const Text(
                'Mis Accesorios',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Añadir Accesorio'),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      // Lógica para añadir accesorio
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Mis Máquinas de Café',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Añadir Máquina de Café'),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      // Lógica para añadir máquina
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Apartado para publicaciones
              const Text(
                'Publicaciones Creadas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Publicaciones'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de publicaciones
                  },
                ),
              ),
              const Text(
                'Recetas Creadas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Recetas'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Metodos de Preparación Creados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Metodos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Cafés Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Cafés Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Marcas de Café Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Marcas de Café Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Productos Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Productos Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Recetas Favoritas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Recetas Favoritas'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
                const Text(
                'Metodos de Preparación Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Metodos Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navegar a la pantalla de recetas
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Botón para volver al menú principal
              Center(
                child: ElevatedButton(
                  onPressed: () {
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

  // Método para construir las cards
  Widget _buildCard(String title, String count) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              count,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class UserScreen extends StatelessWidget {
  final UserNew user;

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
  Widget _buildRecipeList(List<RecipeNew> recipes) {
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
  Widget _buildProductList(List<ProductNew> products) {
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
*/