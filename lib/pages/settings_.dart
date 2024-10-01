import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  
  final String userName;
  final String userEmail;

  const Settings({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'Español'; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //nombre y correo del usuario
            Text(
              userName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              userEmail,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            //selección de idioma
            const Text(
              'Selección de idioma',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
     
              },
              items: <String>['Español', 'Inglés', 'Francés']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            //configuraciones de la cuenta
            const Text(
              'Configuraciones de la cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            //cambiar contraseña
            ListTile(
              title: const Text('Cambiar la contraseña'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {

              },
            ),

            //borrar cuenta
            ListTile(
              title: const Text('Borrar cuenta'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
               
              },
            ),
          ],
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
 
        },
        label: const Text('Cerrar sesión'),
        icon: const Icon(Icons.logout),
      ),
    );
  }
}