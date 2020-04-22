import 'package:flora/image_viewer.dart';
import 'package:flutter/material.dart';

import 'flower.dart';

class FlowerPreview extends StatelessWidget {
  final Flower _flower;
  FlowerPreview(this._flower);

  @override
  Widget build(BuildContext context) {
    final imageWidget = ImageViewer(_flower.image);
    final nameWidget = Text(
      _flower.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: _flower.colors['name'],
        fontSize: 24,
      ),
    );
    final descriptionWidget = Text(
      _flower.description,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: _flower.colors['description'],
      ),
    );

    return Padding(
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
          Padding(
            padding: EdgeInsets.all(5),
            child: descriptionWidget,
          )
        ],
      ),
    );
  }
}
