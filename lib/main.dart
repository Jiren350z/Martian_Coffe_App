import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/home_page_.dart';
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
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Martian Coffee App'),
    );
  }
}



