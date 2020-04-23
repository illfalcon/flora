import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String _image;

  ImageViewer(this._image);

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 300,
      width: 300,
      image: AssetImage(_image),
    );
  }

}