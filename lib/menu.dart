import 'package:flora/flower.dart';
import 'package:flora/flower_card.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  List<Flower> _getFlowers() => [
        Flower(
          "Flower",
          "Some Flower",
          "assets/images/flowers/flower.png",
          ColorSwatch(Colors.blue.value, {
            'name': Colors.blue,
            'description': Colors.black,
            'light': Colors.blue[50],
            'main': Colors.blue[300],
          }),
        ),
        Flower(
          "Flower",
          "Some Flower",
          "assets/images/flowers/flower.png",
          ColorSwatch(Colors.pink.value, {
            'name': Colors.pink,
            'description': Colors.black,
            'light': Colors.pink[100],
            'main': Colors.red[300],
          }),
        ),
      ];

  Widget _buildGrid(List<Widget> contents) => OrientationBuilder(
        builder: (context, orientation) => GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          padding: const EdgeInsets.all(4),
          children: contents,
          childAspectRatio: 0.7,
        ),
      );

  @override
  Widget build(BuildContext context) {
    var flowers = _getFlowers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flora"),
      ),
      body: _buildGrid(
        List.generate(
          flowers.length,
          (i) => Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: FlowerCard(flowers[i]),
          ),
        ),
      ),
    );
  }
}
