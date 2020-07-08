import 'package:flora/ui/menu.dart';
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
            ),
      ),
      home: Menu(),
    );
  }
}
