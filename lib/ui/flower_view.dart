import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flora/ui/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/flower.dart';

class FlowerView extends StatelessWidget {
  final Flower _flower;
  GlobalKey _globalKey = GlobalKey();
  FlowerView(this._flower);

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
    if (boundary.debugNeedsPaint) {
      print("Waiting for boundary to be painted.");
      await Future.delayed(const Duration(milliseconds: 20));
      return _capturePng();
    }
    print("boundary painted.");

    ui.Image image = await boundary.toImage(pixelRatio: 10.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    Share.file("title", "name", pngBytes, "image/png");
//    var documentDirectory = await getApplicationDocumentsDirectory();
//    print(documentDirectory.path);
//    File file = new File(documentDirectory.path + '/image.png');
//    file.writeAsBytes(pngBytes);
//    ImageGallerySaver.saveImage(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = InkWell(child: ImageViewer(_flower.image),
    onTap: _capturePng,);
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

          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: RepaintBoundary(
              key: _globalKey,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: _flower.colors['main'], width: 12.0),),
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
          ),
        ),
      ),
    );
  }
}
