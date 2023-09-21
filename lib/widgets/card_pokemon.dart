import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({super.key, required this.name, required this.habilidad, required this.url});
//  propiedades q recibe

final String name;
final String habilidad;
final String url;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  var pokemons =[];

  @override
  Widget build(BuildContext context) {
    return Card(
      
      clipBehavior: Clip.antiAlias, //funciona como un overflow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(
            color: Colors.lightBlueAccent,
          ),),
      
      elevation: 5,
      
      // shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
          Text(widget.name),
          // Image(image: NetworkImage(widget.url,scale: 0.3), ),
          SvgPicture.network(widget.url,fit: BoxFit.contain, width: 65)
           
            
            ],
        ),
      )
    );
  }



}