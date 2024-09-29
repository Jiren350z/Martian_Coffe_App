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
      
      //recetas creadas de ejemplo 
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
        imageUrl: 'assets/images/cafe_marciano.jpg', // URL de la imagen
        rating: 4.5, // Valoración entre 0.0 y 5.0
      );

      RecipeNew newRecipe2 = RecipeNew(
        name: 'Café Chocolate',
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
        imageUrl: 'assets/images/caffe_chocolate.jpg',
        rating: 3.0,  
     );
     RecipeNew newRecipe3 = RecipeNew(
        name: 'Café Latte',
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
        imageUrl: 'assets/images/caffe_latte.jpg',
        rating: 4.0,  
     );
     RecipeNew newRecipe4 = RecipeNew(
        name: 'Café Mokka',
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
        imageUrl: 'assets/images/caffe_mokka.jpg',
        rating: 4.5,    
     );
     RecipeNew newRecipe5 = RecipeNew(
        name: 'Café Capuccino',
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
        imageUrl: 'assets/images/caffe_capuccino.jpg',
        rating: 4.8,  
     );       
    recipes.add(newRecipe);
    recipes.add(newRecipe2);
    recipes.add(newRecipe3);
    recipes.add(newRecipe4);
    recipes.add(newRecipe5);
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
  }
}


