import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/pages/browser_.dart';
import 'package:martian_cofee_app/pages/my_recipes.dart';
import 'package:martian_cofee_app/pages/my_barist.dart';

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

    RecipeNew newRecipe2 = RecipeNew(
        name: 'Café Chocolate',
        ingredients: ['Cafetera', 'Cuchara'],
        /*
        ingredients: [
        IngredientNew(
          type: 'Agua hirviendo',
          value: 1,
          ubication: "micasa",
          rating: 0.0,
          imageOfIngredient: '',
          ),
        IngredientNew(
          type: 'Sobre de cafe puro',
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
          name: 'Adam Sokravotz',
          email: "im_rock@gmail.com",
          biography: "Dame Cafe",
          typeOfExperienceWithCoffee: "Barista",
          age: 20,
          genre: "Masculino",
          bornData: DateTime(2004,7,3),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "URSS",
          region: "",
          city: "Moscu",
          profileURL: '',
          registrationDate: DateTime(2009,4,10),
          ),
          */
        imageUrl: 'assets/images/caffe_chocolate.jpg',
        //rating: 3.0,  
        registrationDate: DateTime(2009,4,10),
        preparationTime: 0,
     );
      
    RecipeNew newRecipe3 = RecipeNew(
        name: 'Café Latte',
        ingredients: ['Cafetera', 'Cuchara'],
        /*
        ingredients: [
        IngredientNew(
          type: 'Agua hirviendo',
          value: 1,
          ubication: "micasa",
          rating: 0.0,
          imageOfIngredient: '',
          ),
        IngredientNew(
          type: 'Sobre de cafe puro',
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
          name: 'Gine',
          email: "gine23@gmail.com",
          biography: "Reviveme Kakaroto",
          typeOfExperienceWithCoffee: "Consumidor/a",
          age: 21,
          genre: "Femenino",
          bornData: DateTime(2003,3,14),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "Planeta Saiyan",
          region: "",
          city: "",
          profileURL: '',
          registrationDate: DateTime(2009,4,10),
          ),
          */
        imageUrl: 'assets/images/caffe_latte.jpg',
        //rating: 4.0,  
        registrationDate: DateTime(2009,4,10),
        preparationTime: 0,
     );
      
    RecipeNew newRecipe4 = RecipeNew(
        name: 'Café Mokka',
        ingredients: ['Cafetera', 'Cuchara'],
        /*
        ingredients: [
        IngredientNew(
          type: 'Agua hirviendo',
          value: 1, ubication: "micasa",
          rating: 0.0,
          imageOfIngredient: '',),
        IngredientNew(
          type: 'Sobre de cafe puro',
          value: 2,
          ubication: "tucasa",
          rating: 0.0,
          imageOfIngredient: '',),
        ],
        */
          utensils: ['Cafetera', 'Cuchara'],
          preparation: "",
          /*
          userCreator: UserNew(
          name: 'Dante Sparda',
          email: "dantesparda@gmail.com",
          biography: "Dame dinero que estoy endeudado :C",
          typeOfExperienceWithCoffee: "Barista Profesional",
          age: 38,
          genre: "Masculino",
          bornData: DateTime(1986,10,8),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "EEUU",
          region: "New York",
          city: "Brooklyn",
          profileURL: '',
          registrationDate: DateTime(2009,4,10),
          ),
          */
        imageUrl: 'assets/images/caffe_mokka.jpg',
        //rating: 4.5,    
        registrationDate: DateTime(2009,4,10),
        preparationTime: 0,
     );
      
    RecipeNew newRecipe5 = RecipeNew(
        name: 'Café Capuccino',
        ingredients: ['Cafetera', 'Cuchara'],
        /*
        ingredients: [
        IngredientNew(
          type: 'Agua hirviendo',
          value: 1, ubication: "micasa",
          rating: 0.0,
          imageOfIngredient: '',
          ),
        IngredientNew(
          type: 'Sobre de cafe puro',
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
          name: 'Vergil Sparda',
          email: "vergilsparda@gmail.com",
          biography: "Necesito mas cafe, dame mas cafe",
          typeOfExperienceWithCoffee: "Productor de cafeteria",
          age: 38,
          genre: "Masculino",
          bornData: DateTime(1986,10,8),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "EEUU",
          region: "California",
          city: "Los Angeles",
          profileURL: '',
          registrationDate: DateTime(2009,4,10),
          ),
          */
        imageUrl: 'assets/images/caffe_capuccino.jpg',
        //rating: 4.8,  
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
        return const SearchScreen();
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

            icon: Icon(Icons.search),
            label: 'Descubrir',
            
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


