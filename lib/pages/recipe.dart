import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/ingredient.dart';
import 'package:martian_cofee_app/pages/users.dart';

class Recipe {
  String name;
  List<Ingredient> ingredients;
  List<String> utensils;
  User userCreator;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.utensils,
    required this.userCreator,
  });

  void save() {
    
  }

  void create() {
    
  }
}
// Widget que representa una lista de recetas expandibles
class RecipeListWidget extends StatefulWidget {
  final List<Recipe> recipes;

  const RecipeListWidget({super.key, required this.recipes});

  @override
  RecipeListWidgetState createState() => RecipeListWidgetState();
}
class RecipeListWidgetState extends State<RecipeListWidget> {
  // Controlar qué panel está expandido
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    // Inicializar la lista con el mismo tamaño que la cantidad de recetas y establecer en falso.
    _isExpanded = List.filled(widget.recipes.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Recetas'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpanded[index] = !isExpanded;
            });
          },
          children: widget.recipes.map<ExpansionPanel>((Recipe recipe) {
            int index = widget.recipes.indexOf(recipe);
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(recipe.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mostrar ingredientes
                    const Text(
                      'Ingredientes:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.ingredients.map((ingredient) {
                        return Text(
                          '- ${ingredient.type} (${ingredient.value} unidades)',
                          style: const TextStyle(fontSize: 16),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    // Mostrar utensilios
                    const Text(
                      'Utensilios:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.utensils.map((utensil) {
                        return Text(
                          '- $utensil',
                          style: const TextStyle(fontSize: 16),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    // Mostrar el creador de la receta
                    Text(
                      'Creador: ${recipe.userCreator.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    // Botón para guardar receta
                    ElevatedButton(
                      onPressed: () {
                        recipe.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Receta guardada')),
                        );
                      },
                      child: const Text('Guardar Receta'),
                    ),
                    const SizedBox(height: 10),
                    // Botón para crear nueva receta
                    ElevatedButton(
                      onPressed: () {
                        recipe.create();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Nueva receta creada')),
                        );
                      },
                      child: const Text('Crear Nueva Receta'),
                    ),
                  ],
                ),
              ),
              isExpanded: _isExpanded[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*
class RecipeListWidgetState extends State<RecipeListWidget> {
  List<bool> _isExpanded = [];

  @override
  void initState() {
    super.initState();
    _isExpanded = List.filled(widget.recipes.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Recetas')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _isExpanded[index] = !isExpanded;
                });
              },
              children: widget.recipes.map<ExpansionPanel>((recipe) {
                int index = widget.recipes.indexOf(recipe);
                return ExpansionPanel(
                  headerBuilder: (_, isExpanded) => ListTile(
                    title: Text(recipe.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ingredientes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recipe.ingredients.map((ingredient) {
                            return Text('- ${ingredient.type} (${ingredient.value} unidades)',
                                style: const TextStyle(fontSize: 16));
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        const Text('Utensilios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recipe.utensils.map((utensil) {
                            return Text('- $utensil', style: const TextStyle(fontSize: 16));
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Text('Creador: ${recipe.userCreator.name}', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  isExpanded: _isExpanded[index],
                );
              }).toList(),
            ),
          ],
        ),
      ),
      // Botones fuera de la card
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              widget.recipes.first.save();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Receta guardada')));
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              widget.recipes.first.create();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nueva receta creada')));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
*/

