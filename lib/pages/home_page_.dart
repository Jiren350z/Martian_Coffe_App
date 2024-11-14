import 'package:flutter/material.dart';
//import 'package:martian_cofee_app/models/recipe_class.dart';
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



  int _selectedIndex = 0; // para rastrear la pestaña seleccionada

    
                        
  @override
  void initState() {
  
    super.initState();
      
      

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


