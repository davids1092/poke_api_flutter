import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:poke_api_app/widgets/widgets.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  var abilities = [];
  var point = 1;
  var pokemons = [];
  void initState() {
    super.initState();
    fetchData(10, point);
  }

  void prueba() {
    print('entreee');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      drawer: Drawer(
  // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
  // a través de las opciones en el Drawer si no hay suficiente espacio vertical
  // para adaptarse a todo.
  child: ListView(
    // Importante: elimine cualquier padding del ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          // Actualiza el estado de la aplicación
          // ...
        },
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {
          // Actualiza el estado de la aplicación
          // ...
        },
      ),
    ],
  ),
),

      appBar: AppBar(
        title:  Image.asset('assets/img/pokeapi_256.png',fit: BoxFit.contain, width: 100,),

      
        centerTitle: true,
      ),
      body: Center(
     
      child: GridView.count(
  controller: _scrollController,
  crossAxisSpacing: 10,
  padding: const EdgeInsets.all(20),
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: pokemons.map((e) {
    return GestureDetector(
      onTap: () {
        print('Nombre del Pokémon: ${e['name']}');
        Navigator.pushNamed(context, 'detalle', arguments: {
    'pokemon': e,
    'color':e['types'][0]['type']['name']
   
  },);
      },
      child: CardPokemon(
        habilidad: e['name'],
        color:  e['types'][0]['type']['name'] ,
        name: e['name'],
        url: e['sprites']['other']['dream_world']['front_default'],
      ),
    );
  }).toList(),
),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            
            onPressed: ()  {
              _scrollController.animateTo(
                0.0, // Posición a la que se va a desplazar (arriba de la pantalla)
                duration: Duration(seconds: 1), // Duración de la animación
                curve: Curves
                    .easeInOut, // Curva de la animación (puedes ajustarla según tus preferencias)
              );
            },
            heroTag: 'scroll',
            backgroundColor: Colors.amber,
            child:  Icon(Icons.arrow_circle_up),
          ),
          FloatingActionButton(
            onPressed: () async {
              point = point + 10;
              displayDialogAndroid(context);
              await fetchData(10, point);
              Navigator.of(context).pop();
               // Espera a que fetchData(30) se complete
            },
            heroTag: 'more',
            child: const Icon(Icons.add_box_outlined),
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );  
  }

  Future<void> fetchData(int limit, int point) async {
    print('entreeeee');
    final response = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/?limit=$limit&offset=$point'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final pokemonUrls = data['results'] as List<dynamic>;

      // Llama a la función 'pokemon' para cada URL de Pokémon
      for (var urlData in pokemonUrls) {
        final url = urlData['url'];
        await pokemon(url);
      }
    } else {
      print('entre error');
      throw Exception('Failed to load abilities');
    }
  }

  Future<void> pokemon(String url) async {
    print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('entre a onit1111');

      final pokemonName = data['name'];
      final pokemonId = data['id'];
      final pokemonImg = data['sprites']['other']['dream_world']
          ['front_default']; // O cualquier otro dato que necesites
      print('imagneeee $pokemonImg');
      // Agrega el Pokémon a la lista 'pokemons'
      pokemons.add(data);

      setState(() {
        // Actualiza el estado para reflejar los cambios en la lista 'pokemons'
      });
    } else {
      print('entre error');
    }
  }

  void displayDialogAndroid(BuildContext context) {
    // asi se crea una funcion
    //con esto se muestran alertas o dialogs
    showDialog(
        barrierDismissible: false, // cerra el dialog dandole click afuera
        context: context,
        builder: (context) {
          return const AlertWidget();
        });
  }
}
