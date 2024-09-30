import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/coffee_mark_class.dart';
import 'package:martian_cofee_app/models/post_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/shop_class.dart';
import 'package:martian_cofee_app/pages/shop_.dart';
//import 'package:martian_cofee_app/pages/recipe_.dart';
//import 'package:martian_cofee_app/pages/ingredient_.dart';
import 'package:martian_cofee_app/pages/users_.dart';
//import 'package:martian_cofee_app/pages/product_detail_page.dart';
import 'package:martian_cofee_app/pages/post_.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';
//import 'package:intl/intl.dart';
import 'package:martian_cofee_app/pages/browser_.dart';
import 'package:martian_cofee_app/models/browser_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de recetas
  List<RecipeNew> recipes = [];
  List<IngredientNew> ingredients = [];
  List<ProductNew> products = [];
  List<UserNew> users = [];
  List<PreparationMetodNew> metods = [];
  List<CoffeeMarkNew> marks = [];
  List<PostNew> posts = [];
  
  //final List<SearchItemsDelegate> allItems = [];
  //List<ShopNew> shop = [];
  late ShopNew myShop;
  final List<SearchableItem> allItems = []; 

  int _selectedIndex = 0; // para rastrear la pestaña seleccionada
  UserNew userd = UserNew(
    name: 'Renji',
    email: 'renjivj7@gmail.com',
    biography: "Necesito Cafe",
    typeOfExperienceWithCoffee: "Consumidor",
    age: 21,
    genre: "Masculino",
    bornData: DateTime(2003,3,16),
    createdRecipe: [],
    purshasedProducts: [],
    favoritesRecipes: [],
    favoritesProducts: [],
    history: [],
    country: "Chile",
    region: "Metropolitana",
    city: "Santiago",
    profileURL: 'assets/images/gato_mewing.jpg',
    );
  

  IngredientNew ingredientt = IngredientNew(
    type: '',
    value: 100,
    ubication: '',
    rating: 0.0,
    imageOfIngredient: '',
  );
  IngredientNew ingredientt2 = IngredientNew(
    type: '',
    value: 100,
    ubication: '',
    rating: 0.0,
    imageOfIngredient: '',
  );



  // publicaciones de ejemplo
    final postd = [
      PostNew (
        userData: UserNew(
              name: 'Posting',
              email: 'posting@gmail.com',
              biography: "Adoro mi coleccion de cafe",
              typeOfExperienceWithCoffee: "Productor/a",
              age: 15,
              genre: "Masculino",
              bornData: DateTime(2009,4,10),
              createdRecipe: [],
              purshasedProducts: [],
              favoritesRecipes: [],
              favoritesProducts: [],
              history: [],
              country: "Isla Cachirula",
              region: "",
              city: "",
              profileURL:'assets/images/alien_thing.jpg',
          ),
        pubType: 'Receta',
        recipe: RecipeNew(
        name: 'Café Marcianeke',
        ingredients: [
          IngredientNew(
            type: 'Agua Caliente',
            value: 1, ubication: "mi casita",
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
        utensils: ['Cafetera', 'Cuchara'],
        preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "EE.UU",
          region: "Ohio",
          city: "Colombus",
          profileURL: '',
        ),
        imageUrl: 'assets/images/caffe_marciano.jpg', // URL de la imagen
        rating: 4.5, // Valoración entre 0.0 y 5.0
      ),
        ingredient: IngredientNew(
          type: '',
          value: 100,
          ubication: '',
          rating: 0.0,
          imageOfIngredient: '',
        ),
        preparationMetod: PreparationMetodNew(
          name : '',
          description: '',
          preparationTime: 2,
          waterTemperature: 0.0,
          waterAmount: 8.0,
          coffeeAmount: 0.0,
          grindingThickness: '',
          equipment: [],
          flavorNotes: [],
          dificulty: '',
          filterType: '',
          recomendations: '',
          rating: 0.0,
        ),
        image: 'assets/images/caffe_marciano.jpg',
        statement: 'Delicioso café hecho con amor!',
        publicDate: DateTime.now(),
      ),
      PostNew(
          userData: UserNew(
            name: 'Juan Pérez',
            email: 'juanperez@gmail.com',
            biography: "Amo el café",
            typeOfExperienceWithCoffee: "Consumidor",
            age: 30,
            genre: "Masculino",
            bornData: DateTime(1993, 7, 12),
            createdRecipe: [],
            purshasedProducts: [],
            favoritesRecipes: [],
            favoritesProducts: [],
            history: [],
            country: "México",
            region: "Jalisco",
            city: "Guadalajara",
            profileURL: 'assets/images/alien_cat.jpg',
          ),
          pubType: 'Situacion',
          recipe: RecipeNew(
            name: '',
            ingredients: [],
            utensils: [],
            preparation: '',
            userCreator: UserNew(
              name: '',
              email: '',
              biography: '',
              typeOfExperienceWithCoffee: '',
              age: 0,
              genre: '',
              bornData: DateTime.now(),
              createdRecipe: [],
              purshasedProducts: [],
              favoritesRecipes: [],
              favoritesProducts: [],
              history: [],
              country: '',
              region: '',
              city: '',
              profileURL: '',
            ),
            imageUrl: '',
            rating: 0.0,
          ),
          ingredient: IngredientNew(
            type: '',
            value: 0,
            ubication: '',
            rating: 0.0,
            imageOfIngredient: '',
            ),
          preparationMetod: PreparationMetodNew(
            name: '',
            description: '',
            preparationTime: 0,
            waterTemperature: 0.0,
            waterAmount: 0.0,
            coffeeAmount: 0.0,
            grindingThickness: '',
            equipment: [],
            flavorNotes: [],
            dificulty: '',
            filterType: '',
            recomendations: '',
            rating: 0.0,
          ),
          image: 'assets/images/caffe_latte.jpg', // Ruta de la imagen
          statement: 'Este café me encanta por su sabor suave y aroma intenso.',
          publicDate: DateTime.now(),
      ),
      PostNew (
        userData: UserNew(
          name: 'Sara López',
          email: 'saralopez@gmail.com',
          biography: "Barista profesional",
          typeOfExperienceWithCoffee: "Barista",
          age: 28,
          genre: "Femenino",
          bornData: DateTime(1995, 5, 20),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritesProducts: [],
          history: [],
          country: "Colombia",
          region: "Antioquia",
          city: "Medellín",
          profileURL: 'assets/images/alien_dog.jpg',
        ),
        pubType: 'Método',
        recipe: RecipeNew(
          name: '',
          ingredients: [],
          utensils: [],
          preparation: '',
          userCreator: UserNew(
            name: '',
            email: '',
            biography: '',
            typeOfExperienceWithCoffee: '',
            age: 0,
            genre: '',
            bornData: DateTime.now(),
            createdRecipe: [],
            purshasedProducts: [],
            favoritesRecipes: [],
            favoritesProducts: [],
            history: [],
            country: '',
            region: '',
            city: '',
            profileURL: '',
          ),
          imageUrl: '',
          rating: 0.0,
        ),
        ingredient: IngredientNew(
          type: '',
          value: 0,
          ubication: '',
          rating: 0.0,
          imageOfIngredient: '',
          ),
        preparationMetod: PreparationMetodNew(
          name: 'Método Chemex',
          description: 'Un método de preparación suave y claro que resalta las notas frutales.',
          preparationTime: 4,
          waterTemperature: 92.0,
          waterAmount: 500.0,
          coffeeAmount: 30.0,
          grindingThickness: 'Medio grueso',
          equipment: ['Chemex', 'Filtros de papel', 'Cafetera'],
          flavorNotes: ['Afrutado', 'Cítrico'],
          dificulty: 'Medio',
          filterType: 'Papel',
          recomendations: 'Utiliza agua filtrada para un mejor sabor.',
          rating: 4.3,
        ),
        image: 'assets/images/chemex.jpg', // Ruta de la imagen
        statement: 'Método Chemex, perfecto para resaltar los sabores afrutados.',
        publicDate: DateTime.now(),
      ),
        PostNew(
        userData: UserNew(
          name: 'Pedro Martínez',
          email: 'pedromartinez@gmail.com',
          biography: "Amante del café",
          typeOfExperienceWithCoffee: "Consumidor",
          age: 34,
          genre: "Masculino",
          bornData: DateTime(1989, 8, 15),
          createdRecipe: [],
          purshasedProducts: [],
          favoritesRecipes: [],
          favoritesProducts: [],
          history: [],
          country: "Perú",
          region: "Lima",
          city: "Lima",
          profileURL: 'assets/images/alien.jpg',
        ),
        pubType: 'Ingrediente',
        recipe: RecipeNew(
          name: '',
          ingredients: [],
          utensils: [],
          preparation: '',
          userCreator: UserNew(
            name: '',
            email: '',
            biography: '',
            typeOfExperienceWithCoffee: '',
            age: 0,
            genre: '',
            bornData: DateTime.now(),
            createdRecipe: [],
            purshasedProducts: [],
            favoritesRecipes: [],
            favoritesProducts: [],
            history: [],
            country: '',
            region: '',
            city: '',
            profileURL: '',
          ),
          imageUrl: '',
          rating: 0.0,
        ),
        ingredient: IngredientNew(
          type: 'Granos de café Arábica',
          value: 500, // gramos
          ubication: 'Colombia',
          rating: 4.5,
          imageOfIngredient: 'assets/images/cafe_arabico.jpg',
        ),
        preparationMetod: PreparationMetodNew(
          name: '',
          description: '',
          preparationTime: 0,
          waterTemperature: 0.0,
          waterAmount: 0.0,
          coffeeAmount: 0.0,
          grindingThickness: '',
          equipment: [],
          flavorNotes: [],
          dificulty: '',
          filterType: '',
          recomendations: '',
          rating: 0.0,
        ),
        image: 'assets/images/cafe_arabico.jpg', // Ruta de la imagen
        statement: 'Los granos de café Arábica tienen un sabor dulce y suave.',
        publicDate: DateTime.now(),
      ),
    ];   
                            
  @override
  void initState() {
  
    super.initState();
      
      //recetas creadas de ejemplo 
      RecipeNew newRecipe = RecipeNew(
        name: 'Café Marcianeke',
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
        utensils: ['Cafetera', 'Cuchara'],
        preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "EE.UU",
          region: "Ohio",
          city: "Colombus",
          profileURL: '',
        ),
        imageUrl: 'assets/images/caffe_marciano.jpg', // URL de la imagen
        rating: 4.5, // Valoración entre 0.0 y 5.0
      );

      RecipeNew newRecipe2 = RecipeNew(
        name: 'Café Chocolate',
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
          utensils: ['Cafetera', 'Cuchara'],
          preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "URSS",
          region: "",
          city: "Moscu",
          profileURL: '',
          ),
        imageUrl: 'assets/images/caffe_chocolate.jpg',
        rating: 3.0,  
     );
      
      RecipeNew newRecipe3 = RecipeNew(
        name: 'Café Latte',
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
          utensils: ['Cafetera', 'Cuchara'],
          preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "Planeta Saiyan",
          region: "",
          city: "",
          profileURL: '',
          ),
        imageUrl: 'assets/images/caffe_latte.jpg',
        rating: 4.0,  
     );
      
      RecipeNew newRecipe4 = RecipeNew(
        name: 'Café Mokka',
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
          utensils: ['Cafetera', 'Cuchara'],
          preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "EEUU",
          region: "New York",
          city: "Brooklyn",
          profileURL: '',
          ),
        imageUrl: 'assets/images/caffe_mokka.jpg',
        rating: 4.5,    
     );
      
      RecipeNew newRecipe5 = RecipeNew(
        name: 'Café Capuccino',
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
          imageOfIngredient: '',),
        ],
          utensils: ['Cafetera', 'Cuchara'],
          preparation: "",
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
          favoritesProducts: [],
          history: [],
          country: "EEUU",
          region: "California",
          city: "Los Angeles",
          profileURL: '',
          ),
        imageUrl: 'assets/images/caffe_capuccino.jpg',
        rating: 4.8,  
     );       
    
      ProductNew productt = ProductNew(
      name: 'Najjar Coffee con Cardamom 200g',
      id: 022644006361,
      price: 8990,
      description: 
      "Najjar Café puro Arábica brasileño con cardamomo para hacer café al estilo turco, importado del Líbano"
      "Los granos de tostado oscuro se muelen cuidadosamente para producir un café con sabor intenso y rico aroma."
      "Para prepararlo: simplemente añade 1 cucharadita de este café finamente molido por cada taza de 60ml de agua recién calentada. "
      "Calienta revolviendo constantemente hasta que el café se disuelva y luego deja de revolver."
      "Continúe calentando hasta que la superficie del café haga espuma y luego retírelo del fuego antes de que hierva."
      "¡Deja reposar y luego disfruta!"
      ,
      stock: 10,
      contact: "cchicrula@gmail.com",
      userCreator: UserNew(
      name: 'Cachirula',
      email: 'cchirula@gmail.com',
      biography: "Adoro mi coleccion de cafe",
      typeOfExperienceWithCoffee: "Productor/a",
      age: 15,
      genre: "Femenino",
      bornData: DateTime(2009,4,10),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritesProducts: [],
      history: [],
      country: "Isla Cachirula",
      region: "",
      city: "",
      profileURL: '',
      ),
      imageOfProduct: 'assets/images/caffe_najjar.jpg', // Nuevo atributo para la URL de la imagen
      rating: 4.5

    );
    
      ProductNew productt2 = ProductNew(
      name: 'Cafetera Italiana 6 Tazas Greca',
      id: 7465675647,
      price: 5000,
      description: 
      "Vendo Cafetera nueva a buen precio"
      "Material: PVC"
      "Cantidad de piezas: 1 pieza"
      ,
      stock: 28,
      contact: "+5699898877",
      userCreator: UserNew(
      name: 'Brad Vickers',
      email: 'bradvickers@gmail.com',
      biography: "Adoro mi coleccion de cafe",
      typeOfExperienceWithCoffee: "Productor/a",
      age: 25,
      genre: "Masculino",
      bornData: DateTime(2009,4,10),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritesProducts: [],
      history: [],
      country: "EEUU",
      region: "Arklay",
      city: "Racoon City",
      profileURL: '',
      ),
      imageOfProduct: 'assets/images/cafetera_1.jpg', // Nuevo atributo para la URL de la imagen
      rating: 4.5

    );
    
      ProductNew productt3 = ProductNew(
      name: 'Cafetera Nescafe Dolce Gusto Piccolo Xs Negra',
      id: 14550302,
      price: 44.990,
      description: 
      "Material de electrodoméstico: Plástico"
      "País de origen: Indonesia"
      "Condicion del producto: Nuevo"
      "Modelo: 9781"
      "Espumador de leche: No"
      "Posee filtro: No"
      "Capacidad: 0.8 lt"
      ,
      stock: 30,
      contact: "+56895577",
      userCreator: UserNew(
      name: 'Angela Orosco',
      email: 'aorocso@gmail.com',
      biography: "Nativa de Silent Hill",
      typeOfExperienceWithCoffee: "Barista",
      age: 15,
      genre: "Femenino",
      bornData: DateTime(2009,4,10),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritesProducts: [],
      history: [],
      country: "Isla Cachirula",
      region: "",
      city: "",
      profileURL: '',
      ),
      imageOfProduct: 'assets/images/cafetera_2.jpg', // Nuevo atributo para la URL de la imagen
      rating: 4.5

    );
      
      ProductNew productt4 = ProductNew(
      name: '2-Pk Mexican Nescafe Clasico Instant Coffee 200gr/7.05oz ea.',
      id: 575667585,
      price: 24.990,
      description: 
      "Ultimos Stocks Disponibles"
      ,
      stock: 3,
      contact: "966688695",
      userCreator: UserNew(
      name: 'Jimmy Hopkins',
      email: 'jhopkins@gmail.com',
      biography: "Graduado del Peor Instituto de EEUU",
      typeOfExperienceWithCoffee: "Consumidor",
      age: 20,
      genre: "Masculino",
      bornData: DateTime(2009,4,10),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritesProducts: [],
      history: [],
      country: "EEUU",
      region: "Canis Cadem",
      city: "BullWorth",
      profileURL: '',
      ),
      imageOfProduct: 'assets/images/caffe_nescafe.jpg', // Nuevo atributo para la URL de la imagen
      rating: 4.5

    );
      
      ProductNew productt5 = ProductNew(
      name: 'GANO CAFÉ CLASSIC: Para adelgazar, su beneficio y precios',
      id: 002103203020,
      price: 19.990,
      description: 
      "El Gano Café Classic es un delicioso y fino café negro sin azúcar,"
      "altamente potenciado con las magníficas propiedades del hongo Ganoderma Lucidum."
      "Es un producto especialmente recomendado para las personas con problemas de peso,"
      "y para individuos con problemas de glucosa en la sangre."
      ,
      stock: 150,
      contact: "350 7689721",
      userCreator: UserNew(
      name: 'Randy Cunningham',
      email: 'rcunningham@gmail.com',
      biography: "El Ninja del Cafe",
      typeOfExperienceWithCoffee: "Consumidor",
      age: 20,
      genre: "Masculino",
      bornData: DateTime(2009,4,10),
      createdRecipe: [],
      purshasedProducts: [],
      favoritesRecipes: [],
      favoritesProducts: [],
      history: [],
      country: "EEUU",
      region: "",
      city: "NorrisVille",
      profileURL: '',
      ),
      imageOfProduct: 'assets/images/caffe_gano.jpg', // Nuevo atributo para la URL de la imagen
      rating: 4.5

    ); 

    // Ahora puedes crear tu tienda
    myShop = ShopNew(
      name: 'Tienda de Café Marciano',
      products: [productt, productt2, productt3, productt4, productt5],
      payMetods: ['Visa', 'MasterCard', 'Paypal'],
    );


      recipes.add(newRecipe);
      recipes.add(newRecipe2);
      recipes.add(newRecipe3);
      recipes.add(newRecipe4);
      recipes.add(newRecipe5);
      userd.favoritesRecipes.add(newRecipe);
      userd.favoritesRecipes.add(newRecipe2);
      userd.favoritesRecipes.add(newRecipe3);
      userd.favoritesRecipes.add(newRecipe4);
      userd.favoritesRecipes.add(newRecipe5);

  }
   // Método para cambiar entre las pantallas
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  /*
  void openSearch() {
    showSearch(
      context: context,
      delegate: SearchItemsDelegate(allItems),
    );
  }
  */
   // Método para retornar la pantalla según el índice seleccionado
  // Pantallas correspondientes a cada selección de la barra de navegación
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const SearchScreen();
        //openSearch(); // Llama al método para abrir el buscador
        //return const Center(child: Text('Buscando...'));
        //return RecipeListWidget(recipes: recipes);
      case 1:
          return ShopWidget(shop: myShop); 
 
      case 2:
        
        return PostListWidget(posts: postd);
   
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
            icon: Icon(Icons.search),
            label: 'Descubrir',
            //icon: Icon(Icons.menu_book),
            //label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Tienda',
            //icon: Icon(Icons.emoji_food_beverage),
            //label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            //icon: Icon(Icons.shopping_bag),
            //label: 'Productos',
            icon: Icon(Icons.list),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
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


