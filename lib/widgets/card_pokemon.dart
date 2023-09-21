import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon(
      {super.key,
      required this.name,
      required this.habilidad,
      required this.url,
      required this.color});
//  propiedades q recibe

  final String name;
  final String habilidad;
  final String url;
  final String color;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  var pokemons = [];

  @override
  Widget build(BuildContext context) {
    return Card(
        color: (widget.color == "fire")
            ? Colors.red
            : (widget.color == "grass")
                ? Colors.green
                : (widget.color == "water")
                    ? Colors.blue
                    : (widget.color == "bug")
                        ? Colors.green[100]
                        : (widget.color == "normal")
                            ? Colors.amber
                            : (widget.color == "poison")
                                ? Colors.deepOrange
                                : (widget.color == "electric")
                                    ? Colors.yellow
                                    : (widget.color == "ground")
                                        ? Colors.grey
                                        : (widget.color == "fairy")
                                            ? Colors.pink
                                            : (widget.color == "fighting")
                                                ? Colors.tealAccent
                                                : (widget.color == "psychic")
                                                    ? Colors.deepPurple
                                                    : (widget.color == "rock")
                                                        ? Colors.grey[400]
                                                        : (widget.color ==
                                                                "ghost")
                                                            ? Colors.cyan[400]
                                                            : Colors
                                                                .transparent,
        clipBehavior: Clip.antiAlias, //funciona como un overflow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.lightBlueAccent,
          ),
        ),
        elevation: 5,

        // shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: 0,
              child: Image.asset(
                'assets/img/pokeball.png',
                height: 170,
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),),
                  Text(widget.color, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black),),
                  const SizedBox(height: 10,),
                  // Image(image: NetworkImage(widget.url,scale: 0.3), ),
                  SvgPicture.network(widget.url, fit: BoxFit.contain, width: 85, height: 80,)
                ],
              ),
            ),
          ],
        ));
  }
}
