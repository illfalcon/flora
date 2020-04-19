import 'package:flora/flower_preview.dart';
import 'package:flora/flower_viewer.dart';
import 'package:flutter/material.dart';

void main() => runApp(Flora());

class Flora extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flora',
      theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              )),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorSwatch colors = ColorSwatch(Colors.pink.value, {
      'name': Colors.pink,
      'description': Colors.black,
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Flora",
          ),
        ),
        body: Center(
          child: FlowerPreview("Some Flower", "Lorem ipsum",
              "assets/images/flowers/flower.png", colors),
        ));
  }
}
