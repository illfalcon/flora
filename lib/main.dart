import 'package:flora/FlowerViewer.dart';
import 'package:flutter/material.dart';

void main() => runApp(Flora());

class Flora extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flora',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flora",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Center(
        child: FlowerViewer('assets/images/flowers/flower.png'),
      ),
    );
  }
}
