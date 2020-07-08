import 'package:flora/ui/image_viewer.dart';
import 'package:flutter/material.dart';

import '../models/flower.dart';

class FlowerView extends StatelessWidget {
  final Flower _flower;
  FlowerView(this._flower);

  @override
  Widget build(BuildContext context) {
    final imageWidget = ImageViewer(_flower.image);
    final nameWidget = Text(
      _flower.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: _flower.colors['name'],
        fontSize: 36,
      ),
    );
    final shortWidget = Text(
      _flower.shortDescription,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: _flower.colors['name'],
        fontSize: 20,
      ),
    );
    final descriptionWidget = Text(
      _flower.description,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: _flower.colors['description'],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Flora"),
        backgroundColor: _flower.colors['main'] ?? Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: imageWidget,
                ),
                nameWidget,
                shortWidget,
                Padding(
                  padding: EdgeInsets.all(5),
                  child: descriptionWidget,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
