import 'package:flutter/material.dart';
//import 'package:martian_cofee_app/models/browser_class.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Buscar cafés o marcas...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              Center(
                child: Text(
                  'Resultados de búsqueda'
                  )
                ),
            ],
          ),
        ),
      ],
    );
  }
}

//class SearchItemsDelegate extends SearchDelegate<SearchableItem?> {

  /*  
  final List<SearchableItem> allItems;

  SearchItemsDelegate(this.allItems);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    final results = allItems.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView(
      children: results.map<ListTile>((item) {
        return ListTile(
          title: Text(item.name),
          onTap: () {
            // Acciones al seleccionar un resultado
            close(context, item);
          },
        );
      }).toList(),
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = allItems.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView(
      children: suggestions.map<ListTile>((item) {
        return ListTile(
          title: Text(item.name),
          onTap: () {
            query = item.name;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
  */
  /*
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
  */

  // @override
  //Widget buildResults(BuildContext context) {
    
    //return Container();

    /*
    List<SearchableItem> results = allItems.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase()) ||
             item.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
    */
    /*
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: Image.asset(
            item.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: Text(item.name),
          subtitle: Text(item.description),
          onTap: () {
            
            if (item.isProduct) {
              // Navegar a la página del producto
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductWidget(product: item), // Pasamos el item como producto
                ),
              );
            } else if (item.isPost) {
              // Dependiendo del tipo de publicación, redirigimos a la pantalla adecuada
              if (item.postType == 'Receta') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: item.recipe),
                  ),
                );
              } else if (item.postType == 'Ingrediente') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientWidget(ingredient: item.ingredient),
                  ),
                );
              }

            }
            
          },

        );
      },
    );
    */
  //}
  /*
  @override
  Widget buildResults(BuildContext context) {
    List<SearchableItem> results = allItems.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase()) ||
             item.description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: Image.asset(
            item.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: Text(item.name),
          subtitle: Text(item.description),
          onTap: () {
            // Verificar si es un producto o una publicación
            if (item.isProduct) {
              // Navegar a la página del producto
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => ProductWidget(product: shop.products[index]), // Detalles del producto
                  builder: (context) => ProductWidget(product: products[index]),
                ),
              );
            } else {
              // Navegar a la página de la publicación
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: posts[index]), // Detalles de la publicación
                ),
              );
            }
          },
        );
      },
    );
  }
  */
 // @override
  //Widget buildSuggestions(BuildContext context) {
    
    //return Container();
    /*
    List<SearchableItem> suggestions = allItems.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    */
    /*
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.name),
          onTap: () {
            query = suggestion.name;
            showResults(context); // Mostrar los resultados de la búsqueda
          },
        );
      },
    );
    */
  //}
//}