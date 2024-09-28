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
  int _selectedIndex = 0; // para rastrear la pestaña seleccionada
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
  IngredientNew ingredientt = IngredientNew(
    type: '',
    value: 100,
    ubication: '',
  );
                              
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
   // Método para cambiar entre las pantallas
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
   // Método para retornar la pantalla según el índice seleccionado
  // Pantallas correspondientes a cada selección de la barra de navegación
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return RecipeListWidget(recipes: recipes);
      case 1:
        return IngredientWidget(ingredient: ingredientt);
      case 2:
        return ProductWidget(product: productt);
      case 3:
        return UserScreen(user: userd);
      default:
        return const Center(child: Text('Selecciona una opción en la barra de navegación'));
    }
  }
  /*
  Widget _buildSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return RecipeListWidget(recipes: recipes);
      case 1:
        return IngredientWidget(ingredient: ingredientt);
      case 2:
        return ProductWidget(product: productt);
      case 3:
        return UserScreen(user: userd);
      default:
        return const Center(child: Text('Selecciona una opción en la barra de navegación'));
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _getSelectedScreen(), // Pantalla seleccionada basada en el índice
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_food_beverage),
            label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuarios',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
      /*
      body: Column(
        children: [
          // Mover la Card hacia la parte superior
          Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IngredientWidget(ingredient: ingredientt),
                        ),
                      );
                    },
                    child: const Text('Ir a Ingredientes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserScreen(user: userd),
                        ),
                      );
                    },
                    child: const Text('Ir a Usuarios'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductWidget(product: productt),
                        ),
                      );
                    },
                    child: const Text('Ir a Productos'),
                  ),
                ],
              ),
            ),
          ),
          
          // Pantalla seleccionada desde la barra de navegación
          Expanded(
            child: _getSelectedScreen(),
          ),
        ],
      ),
      */
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_food_beverage),
            label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuarios',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
    */
  }
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      
      body: _buildSelectedScreen(), // Cambia el contenido según el índice seleccionado
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuarios',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      
      // Card con los botones aún presente
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IngredientWidget(ingredient: ingredientt)),
                  );
                },
                child: const Text('Ir a Ingredientes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserScreen(user: userd)),
                  );
                },
                child: const Text('Ir a Usuarios'),
              ),
              ElevatedButton(
                onPressed: () {
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
    );
  }
  */
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildSelectedScreen(), // Cambia el contenido según el índice seleccionado
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuarios',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IngredientWidget(ingredient: ingredientt)),
                        );
                      },
                      child: const Text('Ir a Ingredientes'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserScreen(user: userd)),
                        );
                      },
                      child: const Text('Ir a Usuarios'),
                    ),
                    ElevatedButton(
                      onPressed: () {

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
  */
}


/*
class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({super.key});

  @override
  State createState() => _BottomAppBarDemoState();
}
*/
/*
class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {                                            
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Bottom App Bar Demo'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: <Widget>[
            SwitchListTile(
              title: const Text(
                'Floating Action Button',
              ),
              value: _showFab,
              onChanged: _onShowFabChanged,
            ),
            SwitchListTile(
              title: const Text('Notch'),
              value: _showNotch,
              onChanged: _onShowNotchChanged,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Floating action button position'),
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Docked - End'),
              value: FloatingActionButtonLocation.endDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Docked - Center'),
              value: FloatingActionButtonLocation.centerDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Floating - End'),
              value: FloatingActionButtonLocation.endFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Floating - Center'),
              value: FloatingActionButtonLocation.centerFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: () {},
                tooltip: 'Create',
                child: const Icon(Icons.add),
              )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
*/
