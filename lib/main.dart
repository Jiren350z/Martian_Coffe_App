import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/home_page_.dart';
//import 'package:martian_cofee_app/utils/datebase_helper.dart';
import 'package:martian_cofee_app/utils/colors.dart';  // Importa el archivo de colores

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Inicializa los bindings
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martian Coffee App',
      theme: ThemeData(
        //primaryColor: AppColors.primaryColor, // Usamos el color de fondo
        //buttonTheme: ButtonThemeData(
        //  buttonColor: AppColors.buttonColor, // Color de los botones
        //),
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor),
        /*
        primaryColor: AppColors.primaryColor, // Color principal
        secondaryHeaderColor: AppColors.secondaryColor, // Color de fondo
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textColor), // Color de texto
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.buttonColor, // Color de los botones
        ), colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 91)),
        //useMaterial3: true,
        */
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Martian Coffee App'),
    );
  }
}



