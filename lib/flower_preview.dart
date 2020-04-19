import 'package:flora/flower_viewer.dart';
import 'package:flutter/material.dart';

class FlowerPreview extends StatelessWidget {
  String _flowerName;
  String _flowerDescription;
  String _flowerImage;
  ColorSwatch _colorSwatch;

  FlowerPreview(this._flowerName, this._flowerDescription, this._flowerImage,
      this._colorSwatch);

  @override
  Widget build(BuildContext context) {
    final imageWidget = FlowerViewer(_flowerImage);
    final nameWidget = Text(
      _flowerName,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: _colorSwatch['name'],
        fontSize: 24,
      ),
    );
    final descriptionWidget = Text(
      _flowerDescription,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: _colorSwatch['description'],
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
