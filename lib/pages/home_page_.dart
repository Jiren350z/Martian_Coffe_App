import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/post_class.dart';
import 'package:martian_cofee_app/models/preparation_metod_class.dart';
import 'package:martian_cofee_app/models/shop_class.dart';
import 'package:martian_cofee_app/pages/shop_.dart';
import 'package:martian_cofee_app/pages/users_.dart';
import 'package:martian_cofee_app/pages/post_.dart';
import 'package:martian_cofee_app/models/ingredient_class.dart';
import 'package:martian_cofee_app/models/recipe_class.dart';
import 'package:martian_cofee_app/models/users_class.dart';
import 'package:martian_cofee_app/models/product_class.dart';
import 'package:martian_cofee_app/pages/browser_.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late ShopNew myShop;


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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
      history: [],
      country: "Chile",
      region: "Metropolitana",
      city: "Santiago",
      profileURL: 'assets/images/gato_mewing.jpg',
    );
  
    IngredientNew ingredient1 = IngredientNew(
        type: 'Café Arábica',
        value: 15.0,
        ubication: 'Etiopía',
        rating: 4.5,
        imageOfIngredient: 'assets/images/cafe_arabico.jpg',
    );

    IngredientNew ingredient2 = IngredientNew(
        type: 'Café Robusta',
        value: 12.0,
        ubication: 'Vietnam',
        rating: 4.0,
        imageOfIngredient: 'assets/images/cafe_robusta.jpg',
    );

    IngredientNew ingredient3 = IngredientNew(
        type: 'Leche de Almendras',
        value: 8.0,
        ubication: 'California, USA',
        rating: 3.5,
        imageOfIngredient: 'assets/images/leche_de_almendras.jpg',
    );

    IngredientNew ingredient4 = IngredientNew(
        type: 'Azúcar de Caña',
        value: 3.0,
        ubication: 'Brasil',
        rating: 4.7,
        imageOfIngredient: 'assets/images/azucar_de_cana.jpg',
    );

    IngredientNew ingredient5 = IngredientNew(
        type: 'Canela en Polvo',
        value: 5.0,
        ubication: 'Sri Lanka',
        rating: 4.8,
        imageOfIngredient: 'assets/images/canela_polvo.jpg',
    );

    PreparationMetodNew preparationMetod = PreparationMetodNew(
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
          imageOfMetod: 'assets/images/chemex.jpg',
        );
      
    PreparationMetodNew preparationMetod1 = PreparationMetodNew(
          name: 'Método Aeropress',
          description: 'Un método rápido y versátil que permite ajustar la intensidad del café a gusto.',
          preparationTime: 3,
          waterTemperature: 85.0,
          waterAmount: 250.0,
          coffeeAmount: 18.0,
          grindingThickness: 'Fino',
          equipment: ['Aeropress', 'Filtro de papel', 'Agua caliente'],
          flavorNotes: ['Dulce', 'Suave'],
          dificulty: 'Bajo',
          filterType: 'Papel',
          recomendations: 'Experimenta con diferentes tiempos de inmersión para ajustar el sabor.',
          rating: 4.7,
          imageOfMetod: 'assets/images/aeropress.jpg',
      );

    PreparationMetodNew preparationMetod2 = PreparationMetodNew(
          name: 'Método V60',
          description: 'Método de goteo con filtro de papel que resalta la claridad y pureza del sabor.',
          preparationTime: 3,
          waterTemperature: 90.0,
          waterAmount: 300.0,
          coffeeAmount: 18.0,
          grindingThickness: 'Medio-fino',
          equipment: ['V60', 'Filtros de papel', 'Agua caliente'],
          flavorNotes: ['Floral', 'Cítrico'],
          dificulty: 'Medio',
          filterType: 'Papel',
          recomendations: 'Vierte el agua lentamente en movimientos circulares.',
          rating: 4.6,
          imageOfMetod: 'assets/images/v60.jpg',
      );

    PreparationMetodNew preparationMetod3 = PreparationMetodNew(
          name: 'Método Espresso',
          description: 'Un método de extracción rápida y concentrada que produce un café intenso.',
          preparationTime: 1,
          waterTemperature: 93.0,
          waterAmount: 30.0,
          coffeeAmount: 18.0,
          grindingThickness: 'Muy fino',
          equipment: ['Máquina de espresso', 'Agua caliente'],
          flavorNotes: ['Intenso', 'Chocolate'],
          dificulty: 'Alto',
          filterType: 'Metal',
          recomendations: 'Asegúrate de usar un buen prensado para una extracción uniforme.',
          rating: 4.8,
          imageOfMetod: 'assets/images/espresso.jpg',
      );

    PreparationMetodNew preparationMetod4 = PreparationMetodNew(
          name: 'Método French Press',
          description: 'Un método de inmersión que produce un café con cuerpo completo.',
          preparationTime: 4,
          waterTemperature: 96.0,
          waterAmount: 500.0,
          coffeeAmount: 30.0,
          grindingThickness: 'Grueso',
          equipment: ['French Press', 'Agua caliente'],
          flavorNotes: ['Cuerpo completo', 'Nuez'],
          dificulty: 'Bajo',
          filterType: 'Metal',
          recomendations: 'Deja reposar el café durante 4 minutos antes de presionar el émbolo.',
          rating: 4.5,
          imageOfMetod: 'assets/images/french_press.jpg',
      );  

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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
          history: [],
          country: "EEUU",
          region: "California",
          city: "Los Angeles",
          profileURL: '',
          ),
        imageUrl: 'assets/images/caffe_capuccino.jpg',
        rating: 4.8,  
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
              favoritedPreparationMetods: [],
              favoritesProducts: [],
              favoritesIngredient: [],
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
          imageOfMetod: '',
        ),
        image: 'assets/images/caffe_marciano.jpg',
        statement: 'Buenisimo el cafe',
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
            favoritedPreparationMetods: [],
            favoritesProducts: [],
            favoritesIngredient: [],
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
              favoritedPreparationMetods: [],
              favoritesProducts: [],
              favoritesIngredient: [],
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
            imageOfMetod: '',
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
            favoritedPreparationMetods: [],
            favoritesProducts: [],
            favoritesIngredient: [],
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
          imageOfMetod: 'assets/images/chemex.jpg',
        ),
        image: 'assets/images/chemex.jpg', 
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
          favoritedPreparationMetods: [],
          favoritesProducts: [],
          favoritesIngredient: [],
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
            favoritedPreparationMetods: [],
            favoritesProducts: [],
            favoritesIngredient: [],
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
          value: 500, 
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
          imageOfMetod: '',
        ),
        image: 'assets/images/cafe_arabico.jpg', 
        statement: 'Los granos de café Arábica tienen un sabor dulce y suave.',
        publicDate: DateTime.now(),
      ),
    ];   
                            
  @override
  void initState() {
  
    super.initState();
      
      
    

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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
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
      price: 4499,
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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
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
      price: 2499,
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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
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
      price: 1999,
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
      favoritedPreparationMetods: [],
      favoritesProducts: [],
      favoritesIngredient: [],
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


      userd.favoritesRecipes.add(newRecipe);
      userd.favoritesRecipes.add(newRecipe2);
      userd.favoritesRecipes.add(newRecipe3);

      userd.favoritesProducts.add(productt);
      userd.favoritesProducts.add(productt2);
      userd.favoritesProducts.add(productt3);

      userd.favoritesIngredient.add(ingredient1);
      userd.favoritesIngredient.add(ingredient2);
      userd.favoritesIngredient.add(ingredient3);

      userd.favoritedPreparationMetods.add(preparationMetod);
      userd.favoritedPreparationMetods.add(preparationMetod1);
      userd.favoritedPreparationMetods.add(preparationMetod2);

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
        return PostListWidget(posts: postd); 

      case 1:
          return ShopWidget(shop: myShop); 

      case 2:
        return const SearchScreen();
   
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
      //pantalla seleccionada basada en el indice
      body: _getSelectedScreen(), 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.list),
            label: 'Post',

          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.shopping_bag),
            label: 'Tienda',

          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.search),
            label: 'Descubrir',
            
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


