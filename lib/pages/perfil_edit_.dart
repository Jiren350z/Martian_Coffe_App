import 'package:flutter/material.dart';
import 'package:martian_cofee_app/models/users_class.dart';

class EditPerfilScreen extends StatefulWidget {
  
  final UserNew user;

  const EditPerfilScreen({super.key, required this.user});
  
  @override

  EditPerfilScreenState createState() => EditPerfilScreenState();
}

class EditPerfilScreenState extends State<EditPerfilScreen> {
  
  
  String? selectedCountry;
  String? selectedRegion;
  String? selectedCity;
  String? selectedGender;
  String? selectedExperience;
  DateTime? birthDate;
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.user.name;
    bioController.text = widget.user.biography;
    selectedCountry = widget.user.country;
    selectedRegion = widget.user.region;
    selectedCity = widget.user.city;
    selectedGender = widget.user.genre;
    selectedExperience = widget.user.typeOfExperienceWithCoffee;
    birthDate = widget.user.bornData;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {

                },
                child: const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCountry,
              items: [
                'Chile',
                'Argentina',
                'Brasil'
                ]
                  .map((country) => DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
              decoration: const InputDecoration(labelText: "País"),
            ),
            DropdownButtonFormField<String>(
              value: selectedRegion,
              items: [
                'Metropolitana',
                'Valparaíso',
                'Antofagasta'
                ]
                  .map((region) => DropdownMenuItem(
                        value: region,
                        child: Text(region),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                });
              },
              decoration: const InputDecoration(labelText: "Estado/Región"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Ciudad"),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: [
                'Masculino',
                'Femenino',
                'Otro',
                'Prefiero no decirlo'
                ]
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              decoration: const InputDecoration(labelText: "Género"),
            ),
            const SizedBox(height: 20),
            Text("Fecha de nacimiento: ${birthDate != null ? birthDate.toString().substring(0, 10) : 'Seleccionar'}"),
            ElevatedButton(
              onPressed: () async {
                DateTime? selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selected != null) {
                  setState(() {
                    birthDate = selected;
                  });
                }
              },
              child: const Text("Cambiar Fecha de Nacimiento"),
            ),
            DropdownButtonFormField<String>(
              value: selectedExperience,
              items: [
                'Consumidor',
                'Barista',
                'Entusiasta',
                'Productor',
                'Tostador',
                'Propietario de Cafetería',
                'Otro'
                ]
                  .map((experience) => DropdownMenuItem(
                        value: experience,
                        child: Text(experience),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedExperience = value;
                });
              },
              decoration: const InputDecoration(labelText: "Tipo de experiencia con el café"),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: "Biografía"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: instagramController,
              decoration: const InputDecoration(labelText: "Instagram"),
            ),
            TextField(
              controller: facebookController,
              decoration: const InputDecoration(labelText: "Facebook"),
            ),
            TextField(
              controller: twitterController,
              decoration: const InputDecoration(labelText: "Twitter/X"),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {

                },
                child: const Text("Guardar cambios"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}