import 'package:flutter/material.dart';

class RecipeCreationScreen extends StatefulWidget {
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  String selectedMethod = 'Método 1';
  String selectedGrind = 'Fina';
  final TextEditingController waterController = TextEditingController();
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];

  void addStep() {
    setState(() {
      preparationSteps.add({
        'name': TextEditingController(),
        'duration': TextEditingController(),
        'water': TextEditingController(),
        'note': TextEditingController(),
      });
    });
  }

  void saveRecipe() {
    // Lógica para guardar la receta
  }

  void showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Agregar foto de la receta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, size: 30),
                    onPressed: () {
                      // Método para abrir la cámara
                      Navigator.pop(context); // Cierra el modal
                    },
                    tooltip: 'Tomar foto con la cámara',
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_library, size: 30),
                    onPressed: () {
                      // Método para abrir la galería
                      Navigator.pop(context); // Cierra el modal
                    },
                    tooltip: 'Seleccionar foto de la galería',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Método de elaboración", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedMethod,
              items: ['Método 1', 'Método 2', 'Método 3'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newMethod) {
                setState(() {
                  selectedMethod = newMethod!;
                });
              },
            ),
            const SizedBox(height: 16),

            const Text("Tipo de molienda", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedGrind,
              items: ['Fina', 'Media', 'Gruesa'].map((String grind) {
                return DropdownMenuItem<String>(
                  value: grind,
                  child: Text(grind),
                );
              }).toList(),
              onChanged: (String? newGrind) {
                setState(() {
                  selectedGrind = newGrind!;
                });
              },
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: waterController,
                    decoration: const InputDecoration(labelText: 'Agua (ml)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: coffeeController,
                    decoration: const InputDecoration(labelText: 'Café (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: temperatureController,
                    decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
              onPressed: showImageOptions,
              child: const Text('Agregar foto de la receta'),
              ),              
            ),
            
            const SizedBox(height: 16),

            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: step['name'],
                          decoration: const InputDecoration(labelText: 'Nombre del paso'),
                        ),
                        TextField(
                          controller: step['duration'],
                          decoration: const InputDecoration(labelText: 'Duración (minutos)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['water'],
                          decoration: const InputDecoration(labelText: 'Agua (ml)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['note'],
                          decoration: const InputDecoration(labelText: 'Nota'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    coffeeController.dispose();
    temperatureController.dispose();
    for (var step in preparationSteps) {
      step['name'].dispose();
      step['duration'].dispose();
      step['water'].dispose();
      step['note'].dispose();
    }
    super.dispose();
  }
}

/*
class RecipeCreationScreen extends StatefulWidget {
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  String selectedMethod = 'Método 1';
  String selectedGrind = 'Fina';
  final TextEditingController waterController = TextEditingController();
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];
  bool isExpanded = false;

  void addStep() {
    setState(() {
      preparationSteps.add({
        'name': TextEditingController(),
        'duration': TextEditingController(),
        'water': TextEditingController(),
        'note': TextEditingController(),
      });
    });
  }

  void saveRecipe() {
    // Lógica para guardar la receta
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Método de elaboración", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedMethod,
              items: ['Método 1', 'Método 2', 'Método 3'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newMethod) {
                setState(() {
                  selectedMethod = newMethod!;
                });
              },
            ),
            const SizedBox(height: 16),

            const Text("Tipo de molienda", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedGrind,
              items: ['Fina', 'Media', 'Gruesa'].map((String grind) {
                return DropdownMenuItem<String>(
                  value: grind,
                  child: Text(grind),
                );
              }).toList(),
              onChanged: (String? newGrind) {
                setState(() {
                  selectedGrind = newGrind!;
                });
              },
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: waterController,
                    decoration: const InputDecoration(labelText: 'Agua (ml)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: coffeeController,
                    decoration: const InputDecoration(labelText: 'Café (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: temperatureController,
                    decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            StatefulBuilder(
              builder: (BuildContext context, StateSetter setPanelState) {
                return ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (int index, bool isExpanded) {
                    setPanelState(() {
                      this.isExpanded = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const ListTile(
                          title: Text('Agregar foto de la receta'),
                        );
                      },
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // Método para abrir la cámara
                            },
                            tooltip: 'Tomar foto con la cámara',
                          ),
                          IconButton(
                            icon: const Icon(Icons.photo_library),
                            onPressed: () {
                              // Método para abrir la galería
                            },
                            tooltip: 'Seleccionar foto de la galería',
                          ),
                        ],
                      ),
                      isExpanded: isExpanded,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),

            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: step['name'],
                          decoration: const InputDecoration(labelText: 'Nombre del paso'),
                        ),
                        TextField(
                          controller: step['duration'],
                          decoration: const InputDecoration(labelText: 'Duración (minutos)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['water'],
                          decoration: const InputDecoration(labelText: 'Agua (ml)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['note'],
                          decoration: const InputDecoration(labelText: 'Nota'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    coffeeController.dispose();
    temperatureController.dispose();
    for (var step in preparationSteps) {
      step['name'].dispose();
      step['duration'].dispose();
      step['water'].dispose();
      step['note'].dispose();
    }
    super.dispose();
  }
}
*/


/*
class RecipeCreationScreen extends StatefulWidget {
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  String selectedMethod = 'Método 1';
  String selectedGrind = 'Fina';
  final TextEditingController waterController = TextEditingController();
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];
  bool isExpanded = false;

  void addStep() {
    setState(() {
      preparationSteps.add({
        'name': TextEditingController(),
        'duration': TextEditingController(),
        'water': TextEditingController(),
        'note': TextEditingController(),
      });
    });
  }

  void saveRecipe() {
    // Lógica para guardar la receta
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Método de elaboración
            const Text("Método de elaboración", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedMethod,
              items: ['Método 1', 'Método 2', 'Método 3'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newMethod) {
                setState(() {
                  selectedMethod = newMethod!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Tipo de molienda
            const Text("Tipo de molienda", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedGrind,
              items: ['Fina', 'Media', 'Gruesa'].map((String grind) {
                return DropdownMenuItem<String>(
                  value: grind,
                  child: Text(grind),
                );
              }).toList(),
              onChanged: (String? newGrind) {
                setState(() {
                  selectedGrind = newGrind!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Agua, café y temperatura
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: waterController,
                    decoration: const InputDecoration(labelText: 'Agua (ml)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: coffeeController,
                    decoration: const InputDecoration(labelText: 'Café (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: temperatureController,
                    decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Foto de la receta
            ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  this.isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Agregar foto de la receta'),
                    );
                  },
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          // Método para abrir la cámara
                        },
                        tooltip: 'Tomar foto con la cámara',
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_library),
                        onPressed: () {
                          // Método para abrir la galería
                        },
                        tooltip: 'Seleccionar foto de la galería',
                      ),
                    ],
                  ),
                  isExpanded: isExpanded,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de pasos de preparación
            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: step['name'],
                          decoration: const InputDecoration(labelText: 'Nombre del paso'),
                        ),
                        TextField(
                          controller: step['duration'],
                          decoration: const InputDecoration(labelText: 'Duración (minutos)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['water'],
                          decoration: const InputDecoration(labelText: 'Agua (ml)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['note'],
                          decoration: const InputDecoration(labelText: 'Nota'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            
            // Botón para agregar otro paso
            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    coffeeController.dispose();
    temperatureController.dispose();
    for (var step in preparationSteps) {
      step['name'].dispose();
      step['duration'].dispose();
      step['water'].dispose();
      step['note'].dispose();
    }
    super.dispose();
  }
}
*/

/*
class RecipeCreationScreen extends StatefulWidget {
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  String selectedMethod = 'Método 1';
  String selectedGrind = 'Fina';
  final TextEditingController waterController = TextEditingController();
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];
  bool isExpanded = false; // Estado para controlar la expansión del panel

  void addStep() {
    setState(() {
      preparationSteps.add({
        'name': TextEditingController(),
        'duration': TextEditingController(),
        'water': TextEditingController(),
        'note': TextEditingController(),
      });
    });
  }

  // Función para guardar la receta
  void saveRecipe() {
    // Lógica para guardar la receta
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Método de elaboración
            const Text("Método de elaboración", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedMethod,
              items: ['Método 1', 'Método 2', 'Método 3'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newMethod) {
                setState(() {
                  selectedMethod = newMethod!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Tipo de molienda
            const Text("Tipo de molienda", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedGrind,
              items: ['Fina', 'Media', 'Gruesa'].map((String grind) {
                return DropdownMenuItem<String>(
                  value: grind,
                  child: Text(grind),
                );
              }).toList(),
              onChanged: (String? newGrind) {
                setState(() {
                  selectedGrind = newGrind!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Agua, café y temperatura
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: waterController,
                    decoration: const InputDecoration(labelText: 'Agua (ml)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: coffeeController,
                    decoration: const InputDecoration(labelText: 'Café (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: temperatureController,
                    decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Foto de la receta
            ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  this.isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Agregar foto de la receta'),
                    );
                  },
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          // Método para abrir la cámara
                        },
                        tooltip: 'Tomar foto con la cámara',
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_library),
                        onPressed: () {
                          // Método para abrir la galería
                        },
                        tooltip: 'Seleccionar foto de la galería',
                      ),
                    ],
                  ),
                  isExpanded: isExpanded,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de pasos de preparación
            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: step['name'],
                          decoration: const InputDecoration(labelText: 'Nombre del paso'),
                        ),
                        TextField(
                          controller: step['duration'],
                          decoration: const InputDecoration(labelText: 'Duración (minutos)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['water'],
                          decoration: const InputDecoration(labelText: 'Agua (ml)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['note'],
                          decoration: const InputDecoration(labelText: 'Nota'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Botón para agregar otro paso
            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    coffeeController.dispose();
    temperatureController.dispose();
    for (var step in preparationSteps) {
      step['name'].dispose();
      step['duration'].dispose();
      step['water'].dispose();
      step['note'].dispose();
    }
    super.dispose();
  }
}
*/

/*
class RecipeCreationScreen extends StatefulWidget {
  
  const RecipeCreationScreen({super.key});

  @override
  RecipeCreationScreenState createState() => RecipeCreationScreenState();
}

class RecipeCreationScreenState extends State<RecipeCreationScreen> {
  String selectedMethod = 'Método 1';
  String selectedGrind = 'Fina';
  final TextEditingController waterController = TextEditingController();
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final List<Map<String, dynamic>> preparationSteps = [];
  bool isExpanded = false; // Estado para controlar la expansión del panel

  
  
  
  void addStep() {
    setState(() {
      preparationSteps.add({
        'name': TextEditingController(),
        'duration': TextEditingController(),
        'water': TextEditingController(),
        'note': TextEditingController(),
      });
    });
  }

  // Función para guardar la receta
  void saveRecipe() {
    // Lógica para guardar la receta
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Crear Receta'),
            IconButton(
              onPressed: saveRecipe,
              icon: const Icon(Icons.save),
              tooltip: 'Guardar Receta',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Método de elaboración
            const Text("Método de elaboración", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedMethod,
              items: ['Método 1', 'Método 2', 'Método 3'].map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (String? newMethod) {
                setState(() {
                  selectedMethod = newMethod!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Tipo de molienda
            const Text("Tipo de molienda", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedGrind,
              items: ['Fina', 'Media', 'Gruesa'].map((String grind) {
                return DropdownMenuItem<String>(
                  value: grind,
                  child: Text(grind),
                );
              }).toList(),
              onChanged: (String? newGrind) {
                setState(() {
                  selectedGrind = newGrind!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Agua, café y temperatura
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: waterController,
                    decoration: const InputDecoration(labelText: 'Agua (ml)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: coffeeController,
                    decoration: const InputDecoration(labelText: 'Café (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: temperatureController,
                    decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Foto de la receta
            ElevatedButton(
              onPressed: () {
                ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      this.isExpanded = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const ListTile(
                          title: Text('Agregar foto de la receta'),
                        );
                      },
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // Método para abrir la cámara
                            },
                            tooltip: 'Tomar foto con la cámara',
                          ),
                          IconButton(
                            icon: const Icon(Icons.photo_library),
                            onPressed: () {
                              // Método para abrir la galería
                            },
                            tooltip: 'Seleccionar foto de la galería',
                          ),
                        ],
                      ),
                      isExpanded: isExpanded,
                    ),
                  ],
                );
              },
              child: const Text('Agregar foto de la receta'),
            ),
            const SizedBox(height: 16),

            // Lista de pasos de preparación
            const Text("Pasos de preparación", style: TextStyle(fontSize: 18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preparationSteps.length,
              itemBuilder: (context, index) {
                final step = preparationSteps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: step['name'],
                          decoration: const InputDecoration(labelText: 'Nombre del paso'),
                        ),
                        TextField(
                          controller: step['duration'],
                          decoration: const InputDecoration(labelText: 'Duración (minutos)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['water'],
                          decoration: const InputDecoration(labelText: 'Agua (ml)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: step['note'],
                          decoration: const InputDecoration(labelText: 'Nota'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Botón para agregar otro paso
            Center(
              child: ElevatedButton(
                onPressed: addStep,
                child: const Text('Agregar paso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    coffeeController.dispose();
    temperatureController.dispose();
    for (var step in preparationSteps) {
      step['name'].dispose();
      step['duration'].dispose();
      step['water'].dispose();
      step['note'].dispose();
    }
    super.dispose();
  }
}
*/