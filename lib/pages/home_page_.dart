import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
//import 'package:martian_cofee_app/pages/browser_.dart';
import 'package:martian_cofee_app/pages/my_recipes.dart';
import 'package:martian_cofee_app/pages/my_barist.dart';
import 'package:martian_cofee_app/pages/opinion.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //late ShopNew myShop;
  List<RecipeNew> favoritesRecipes = [];

  int _selectedIndex = 0; // para rastrear la pestaña seleccionada

    
    RecipeNew newRecipe = RecipeNew(
        name: 'Café Marcianeke',
        ingredients: ['Cafetera', 'Cuchara'],
        /*
        ingredients: [
          IngredientNew(
            type: 'Agua Caliente',
            value: 1,
            ubication: "mi casita",
            rating: 0.0,
            imageOfIngredient: '',
            ),
          IngredientNew(
            type: 'Café en polvo',
            value: 2,
            ubication: "tucasa",
            rating: 0.0,
            imageOfIngredient: '',
            ),
        ],
        */
        utensils: ['Cafetera', 'Cuchara'],
        preparation: "",
        
        /*
        userCreator: UserNew(
          name: 'John Doe',
          email: "imprimansuenio@gmail.com",
          biography: "Amo el cafe",
          typeOfExperienceWithCoffee: "Consumidor",
          age: 24,
          genre: "Masculino",
          bornData: DateTime(2000,5,6),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "EE.UU",
          region: "Ohio",
          city: "Colombus",
          profileURL: '',
          registrationDate: DateTime(2009,4,10),
        ),
        */
        imageUrl: 'assets/images/caffe_marciano.jpg', // URL de la imagen
        //rating: 4.5, // Valoración entre 0.0 y 5.0
        registrationDate: DateTime(2009,4,10),
        preparationTime: 0,
      );

                        
  @override
  void initState() {
  
    super.initState();
      
      
      favoritesRecipes.add(newRecipe);

  }
   //metodo para cambiar entre las pantallas
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   //metodo para retornar la pantalla segun el indice seleccionado
  //pantallas correspondientes a cada seleccion de la barra de navegacion
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const MyRecipesWidget(); 

      case 1:
        return MyBaristWidget(); 

      case 2:
        return FeedbackScreen();
        //return const SearchScreen();
      /*  
      case 3:
        return UserScreen(user: userd);
      */
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
      //pantalla seleccionada basada en el indice
      body: _getSelectedScreen(), 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          //mi barista
          BottomNavigationBarItem(
            
            icon: Icon(Icons.list),
            label: 'Mis Recetas',

          ),
          //mis recetas
          BottomNavigationBarItem(

            icon: Icon(Icons.coffee),
            label: 'Mi Barista',

          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.comment),
            label: 'Mi Opinion',
            
          ),

          /*          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
          */
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}


