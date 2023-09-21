import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          elevation: 5,
           shape: RoundedRectangleBorder( // redondear la alerta
        borderRadius: BorderRadius.circular(30)
      ),
          // title:const Text('Titulo'),
          content: const Column(
            mainAxisSize: MainAxisSize.min, // con este se determina el tamaño de la alerta, ene ste caso lodetermina el contenido
            children: [
              Text('Cargando mas personajes'),
              SizedBox(height: 10,),
              SpinKitFadingCube(
  color: Colors.indigo,
  size: 50.0,
)
        
            ],
          ),
      
        );
  }
}