//import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/recipe_detail_page.dart';
import 'package:martian_cofee_app/utils/datebase_helper.dart';
//import 'package:martian_cofee_app/pages/product_detail_page.dart';

class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();

  // Cargar las recetas directamente en el FutureBuilder
  Future<List<RecipeNew>> _loadRecipes() async {
    // Pre-cargamos las recetas si aún no están en la base de datos
    //await dbHelper.preloadRecipes(); // Esto carga las recetas desde el archivo JSON
    return await dbHelper.getRecipesFromJson(); // Luego obtenemos las recetas desde la base de datos
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: FutureBuilder<List<RecipeNew>>(
        future: _loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                recipe.isAssetImage = true;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe, fromJson: true),
                        ),
                      ).then((value) {
                        setState(() {}); // Refrescar la lista de recetas al volver
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          recipe.isAssetImage
                          ? Image.asset(
                              recipe.imageUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('Error al cargar la imagen');
                              },
                            )
                          : recipe.imageUrl.isNotEmpty
                            ? Image.file(
                                File(recipe.imageUrl),
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              )
                            : const Placeholder(fallbackHeight: 150),
                          //recipe.imageUrl.isNotEmpty
                          //? Image.file(File(recipe.imageUrl))
                          //: const Placeholder(fallbackHeight: 150),
                          /*
                          Image.asset(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          ),
                          */
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

//4, no funciona
/*
class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();
  late Future<List<RecipeNew>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _initializeRecipes();
  }

  // Función para cargar recetas desde la base de datos o JSON
  Future<void> _initializeRecipes() async {
    await dbHelper.preloadRecipes(); // Preload desde JSON si la tabla está vacía
    setState(() {
      _recipesFuture = dbHelper.getAllRecipes(); // Obtener recetas de la BD
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: FutureBuilder<List<RecipeNew>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe),
                        ),
                      ).then((value) {
                        _initializeRecipes(); // Recargar recetas al regresar
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/
//3, no funciona
/*
class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();
  late Future<List<RecipeNew>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _initializeRecipes();
  }

  // Función para cargar recetas desde la base de datos o JSON
  Future<void> _initializeRecipes() async {
    await dbHelper.preloadRecipes(); // Preload desde JSON si la tabla está vacía
    setState(() {
      _recipesFuture = dbHelper.getAllRecipes(); // Obtener recetas de la BD
    });
  }

  /*
  Future<void> _initializeRecipes() async {
    await dbHelper.preloadRecipes(); // Preload desde JSON si la tabla está vacía
    setState(() {
      _recipesFuture = dbHelper.getAllRecipes(); // Obtener recetas de la BD
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: FutureBuilder<List<RecipeNew>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe),
                        ),
                      ).then((value) {
                        _initializeRecipes(); // Recargar recetas al regresar
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*
                          recipe.imageUrl.isNotEmpty
                          ? Image.file(File(recipe.imageUrl))
                          : const Placeholder(fallbackHeight: 150),
                          
                          */
                          Image.asset(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/
//2
/*
class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();

  Future<List<RecipeNew>> _loadRecipes() async {
    return await dbHelper.getAllRecipes(); // Cargar todas las recetas desde la BD o JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: FutureBuilder<List<RecipeNew>>(
        future: _loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe),
                        ),
                      ).then((value) {
                        setState(() {}); // Refrescar la lista de recetas al volver
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/
//1
/*
class MyBaristWidget extends StatefulWidget {
  const MyBaristWidget({Key? key}) : super(key: key);

  @override
  _MyBaristWidgetState createState() => _MyBaristWidgetState();
}

class _MyBaristWidgetState extends State<MyBaristWidget> {
  final dbHelper = DatabaseHelper();

  Future<List<RecipeNew>> _loadRecipes() async {
    return await dbHelper.getAllRecipes(); // Cargar todas las recetas desde la BD
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: FutureBuilder<List<RecipeNew>>(
        future: _loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipe),
                        ),
                      ).then((value) {
                        setState(() {}); // Refrescar la lista de recetas al volver
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Error al cargar la imagen');
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/

//prototipo
/*
class MyBaristWidget extends StatelessWidget {
  final List<RecipeNew> recipes;
  //final ProductWidget product;
  
  const MyBaristWidget({super.key, required this.recipes/*, required this.product*/});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Barista')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          //final productt = product;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 4,
            
            child: InkWell(
              onTap: () {
                // navegar a la pagina de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe /*, product: productt*/),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // mostrar la imagen de la receta
                    Image.asset(
                      recipe.imageUrl,
                      fit: BoxFit.cover, 
                      height: 200, // altura de la imagen
                      width: double.infinity, // ancho completo
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      recipe.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    /*
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < recipe.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    */
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );

  }
}
*/