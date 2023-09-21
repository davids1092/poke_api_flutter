import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({super.key, required this.pokemon, required this.color});

  final dynamic pokemon;
  final String color;
  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: (widget.color == "fire")
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
        // appBar: AppBar(
        //   title: Text(widget.pokemon['name']),
        //     backgroundColor: Colors.transparent,
        // ),
        body: Stack(
          children: [
             Positioned(
            top: 20,
            left: 5,
            child: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,), onPressed: (){
                Navigator.pop(context);
            }),
          ),
            Positioned(
              top: height * 0.10,
              right: -30,
              child: Image.asset(
                'assets/img/pokeball.png',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      
                      color: Colors.red,
                      // child: Text('Hola'),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 150,
                left: (width / 2) - 50,
                child: SvgPicture.network(
                  widget.pokemon['sprites']['other']['dream_world']
                      ['front_default'],
                  fit: BoxFit.contain,
                  height: 170,
                  width: 170,
                )),
            Positioned(
                top: 90,
                left: 20,
                child: Column(
                  children: [
                    Text(
                      widget.pokemon['name'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text(
                          widget.pokemon['types'][0]['type']['name'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
