import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/pages/settings_.dart';
import 'package:martian_cofee_app/pages/help_.dart';
import 'package:martian_cofee_app/pages/perfil_edit_.dart';

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
                  const SizedBox(width: 10),
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
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Espaciado para la imagen de perfil

              Center(
                child: Column(
                  children: [
                    // Imagen de perfil circular
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                      user.profileURL,

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
                        const SizedBox(width: 5),
                        Text(user.city)
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
              // Nueva Card para Biografía, Tipo de Experiencia y Edad
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
                    
                    // Texto de la biografía
                    Text(
                      user.biography,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),

                    // Edad
                    Text(
                      'Edad: ${user.age} años',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 20, 20)),
                    ),
                    // Genero
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
