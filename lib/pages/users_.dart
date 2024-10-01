import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/pages/settings_.dart';
import 'package:martian_cofee_app/pages/help_.dart';
import 'package:martian_cofee_app/pages/perfil_edit_.dart';
import 'package:martian_cofee_app/pages/favorites_recipes_.dart';

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
                  
                  IconButton(
                    icon: const Icon(
                      Icons.help,
                      color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpScreen(
                            userName: user.name,
                            userEmail: user.email,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpScreen(
                            userName: user.name,
                            userEmail: user.email,
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.help,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  */
                  const SizedBox(width: 10),
                  
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPerfilScreen(
                            user: user,
                          ),
                        ),
                      );
                    },
                  ),
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPerfilScreen(
                            user: user,
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  */
                  const SizedBox(width: 10),
                  
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black),
                    onPressed: () {
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
                  ),
                  /*
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
                      color: Colors.black,
                    ),
                  ),
                  */
                ],
              ),
              const SizedBox(height: 10), //espaciado para la imagen de perfil

              Center(
                child: Column(
                  children: [
                    //imagen de perfil circular
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                      user.profileURL,

                      ),
                    ),
                    const SizedBox(height: 10),
                    //nombre del usuario
                    Text(
                      user.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //nacionalidad con la bandera
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flag), 
                        const SizedBox(width: 5),
                        Text(user.country),
                        const SizedBox(width: 5),
                        Text(user.city)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2, //largo
                childAspectRatio: 1.7, // ancho
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(), // evitar scroll independiente
                children: [
                  _buildCard('Publicaciones', '0'), 
                  _buildCard('Ingredientes Publicados', '0'),
                  _buildCard('Ingredientes Favoritos', '0'),
                  //_buildCard('Cafés Favoritos', '0'),
                  //_buildCard('Marcas de Café Favoritos', '0'),
                  _buildCard('Productos Favoritos', '0'),
                  _buildCard('Recetas Favoritas', '0'),
                  _buildCard('Recetas Creadas', '0'),
                  _buildCard('Métodos de Preparación Favoritos', '0'),
                  _buildCard('Métodos de Preparación Creados', '0'),
                  
                ],
              ),
              // nueva card para Biografia, tipo de experiencia y edad
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //biografia con el tipo de experiencia con el cafe
                    Row(
                      children: [
                        const Text(
                          'Biografía',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '(${user.typeOfExperienceWithCoffee})',
                          style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    
                    // texto de la biografia
                    Text(
                      user.biography,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),

                    // edad
                    Text(
                      'Edad: ${user.age} años',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 20, 20)),
                    ),
                    // genero
                    Text(
                      'Genero: ${user.genre}',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 20, 20)),
                    ),
                    // fecha de nacimiento
                    Text(
                      'fecha de nacimiento: ${user.bornData}',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 20, 20)),
                    ),
                  ],
                ),
              ),
            ),

              const SizedBox(height: 20),
              // apartado para accesorios y maquinas
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
    
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // apartado para publicaciones
              const Text(
                'Publicaciones Creadas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Publicaciones'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    
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

                  },
                ),
              ),
                const Text(
                'Ingredientes Publicados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Mis Cafés Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {

                  },
                ),
              ),
                const Text(
                'Ingredientes Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: const Text('Ver Marcas de Café Favoritos'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeListWidget(recipes:user.favoritesRecipes,),
                      ),
                    );

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
        
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // metodo para construir las cards
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
