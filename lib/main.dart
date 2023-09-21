import 'package:flutter/material.dart';
import 'package:poke_api_app/screens/home_screen.dart';

import 'screens/pokemon_detalle_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const HomeScreen(),
      initialRoute: 'home',
      routes: {
        'home' :(context) => const HomeScreen(),
         'detalle': (context) {
    // Obtener los argumentos pasados a través de la ruta
    final args = ModalRoute.of(context)!.settings.arguments as Map<Object, dynamic>;
    return DetalleScreen(
      pokemon: args['pokemon'],
      
    );
  },
        
      },
    );
  }
}



