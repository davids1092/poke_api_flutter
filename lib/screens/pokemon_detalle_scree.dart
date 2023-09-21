import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({super.key, required this.pokemon});


final dynamic pokemon;
  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon['name']),
      ),
      body: Center(
        child:  Column(
          children: [
            Text(widget.pokemon['name']),
            SvgPicture.network(widget.pokemon['sprites']['other']['dream_world']['front_default'],fit: BoxFit.contain, width: 65)

          ],
        ),
      ),
    );
  }
}