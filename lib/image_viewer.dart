import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String _image;

  ImageViewer(this._image);

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 200,
      width: 200,
      image: AssetImage(_image),
    );
  }

}