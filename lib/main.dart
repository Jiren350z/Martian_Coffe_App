import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/home_page_.dart';
/*
import 'package:martian_cofee_app/pages/recipe.dart';
import 'package:martian_cofee_app/pages/ingredient.dart'; 
import 'package:martian_cofee_app/pages/Users.dart';
import 'package:martian_cofee_app/pages/product.dart';
*/

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 139, 58, 183)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Cafe Universal'),
    );
  }
}



/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
                        
                        Recipe reciped = Recipe(
                          name: 'Café Marciano',
                          ingredients: [
                            Ingredient(type: 'Agua', value: 1, ubication: "miasa"),
                            Ingredient(type: 'Café en polvo', value: 2, ubication: "tucasa"),
                          ],
                          utensils: ['Cafetera', 'Cuchara'],
                          userCreator: User(name: 'John Doe',
                          email: "asfjadasdsa",
                          createdRecipe: [],
                          purshasedProducts: [],
                          favorites: [],
                          history: []),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecipeWidget(recipe: reciped)),
                        );
                      },
                      child: const Text('Ir a Recetas'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                            
                        Ingredient ingredientt = Ingredient(
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
                        
                        User userd = User(
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

                        Product productt = Product(
                        name: 'hola',
                        id: 121234,
                        price: 9999,
                        userCreator: User(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
