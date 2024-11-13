import 'package:flutter/material.dart';
import 'package:martian_cofee_app/pages/home_page_.dart';
//import 'package:martian_cofee_app/utils/datebase_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Inicializa los bindings
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe_Universal',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 91)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Cafe Universal'),
    );
  }
}



