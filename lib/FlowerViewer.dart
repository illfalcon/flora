import 'package:flutter/material.dart';

class FlowerViewer extends StatelessWidget {
  final String _image;

  FlowerViewer(this._image);

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 300,
      width: 300,
      image: AssetImage(_image),
    );
  }

}