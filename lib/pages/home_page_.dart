import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/recipe_.dart';
import 'package:martian_cofee_app/pages/ingredient_.dart';
import 'package:martian_cofee_app/pages/users_.dart';
import 'package:martian_cofee_app/pages/product_.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de recetas
  List<RecipeNew> recipes = [];

  @override
  void initState() {
  
    super.initState();

      RecipeNew newRecipe = RecipeNew(
                          name: 'Café Marcianeke',
                          ingredients: [
                            IngredientNew(type: 'Agua', value: 1, ubication: "micasa"),
                            IngredientNew(type: 'Café en polvo', value: 2, ubication: "tucasa"),
                          ],
                          utensils: ['Cafetera', 'Cuchara'],
                          userCreator: UserNew(
                            name: 'John Doe',
                            email: "imprimansuenio@gmail.com",
                            createdRecipe: [],
                            purshasedProducts: [],
                            favoritesRecipes: [],
                            favoritesProducts: [],
                            history: [],
                            country: "EE.UU",
                          ),
                        );

                        RecipeNew newRecipe2 = RecipeNew(
                          name: 'Café Cafe',
                          ingredients: [
                            IngredientNew(type: 'Agua hirviendo', value: 1, ubication: "micasa"),
                            IngredientNew(type: 'Sobre de cafe puro', value: 2, ubication: "tucasa"),
                          ],
                          utensils: ['Cafetera', 'Cuchara'],
                          userCreator: UserNew(
                            name: 'Adam Sokravotz',
                            email: "imprimanplata@gmail.com",
                            createdRecipe: [],
                            purshasedProducts: [],
                            favoritesRecipes: [],
                            favoritesProducts: [],
                            history: [],
                            country: "URSS",
                          ),
                        );
          recipes.add(newRecipe);
          recipes.add(newRecipe2);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Aquí añadimos la Card con los botones
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Crear una nueva receta
                      
                        
                        // Añadir la nueva receta a la lista de recetas
                        /*
                        setState(() {
                          recipes.add(newRecipe);
                          recipes.add(newRecipe2);
                        });
                        */
                        // Navegar a la lista de recetas
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeListWidget(recipes: recipes),
                          ),
                        );
                      },
                      child: const Text('Ir a Recetas'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        IngredientNew ingredientt = IngredientNew(
                          type: '',
                          value: 100,
                          ubication: '',
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IngredientWidget(ingredient: ingredientt)),
                        );
                      },
                      child: const Text('Ir a Ingredientes'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        UserNew userd = UserNew(
                          name: 'Renji',
                          email: 'RenjiVJ7@gmail.com',
                          createdRecipe: [],
                          purshasedProducts: [],
                          favoritesRecipes: [],
                          favoritesProducts: [],
                          history: [],
                          country: "Chile"
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserScreen(user: userd)),
                        );
                      },
                      child: const Text('Ir a Usuarios'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ProductNew productt = ProductNew(
                          name: 'hola',
                          id: 121234,
                          price: 9999,
                          userCreator: UserNew(
                            name: 'cachirula',
                            email: 'mimami',
                            createdRecipe: [],
                            purshasedProducts: [],
                            favoritesRecipes: [],
                            favoritesProducts: [],
                            history: [],
                            country: "isla cachirula",
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductWidget(product: productt)),
                        );
                      },
                      child: const Text('Ir a Productos'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            // Aquí añadimos la Card con los botones
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        
                        RecipeNew reciped = RecipeNew(
                          name: 'Cafe Marcianeke',
                          ingredients: [
                            IngredientNew(type: 'Agua', value: 1, ubication: "miasa"),
                            IngredientNew(type: 'Café en polvo', value: 2, ubication: "tucasa"),
                          ],
                          utensils: ['Cafetera', 'Cuchara'],
                          userCreator: UserNew(name: 'John Doe',
                          email: "asfjadasdsa",
                          createdRecipe: [],
                          purshasedProducts: [],
                          favorites: [],
                          history: []),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecipeListWidget(recipes: [reciped])),
                        );
                      },
                      child: const Text('Ir a Recetas'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                            
                        IngredientNew ingredientt = IngredientNew(
                          type: '',
                          value: 100,
                          ubication: '');

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IngredientWidget(ingredient: ingredientt)),
                        );
                      },
                      child: const Text('Ir a Ingredientes'),
                    ),
                   
                    ElevatedButton(
                      onPressed: () {
                        
                        UserNew userd = UserNew(
                          name: 'snake',
                          email: '565656767',
                          createdRecipe: [],
                          purshasedProducts: [],
                          favorites: [],
                          history: []
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserScreen(user: userd)),
                        );
                      },
                      child: const Text('Ir a Usuarios'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        ProductNew productt = ProductNew(
                        name: 'hola',
                        id: 121234,
                        price: 9999,
                        userCreator: UserNew(
                          name: 'cachirula',
                          email: 'mimami',
                          createdRecipe: [],
                          purshasedProducts: [],
                          favorites: [],
                          history: []));

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductWidget(product: productt)),
                        );
                      },
                      child: const Text('Ir a Productos'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
*/
