import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flora/database/database_helper.dart';
import 'package:flora/models/flower.dart';
import 'package:flora/ui/flower_card.dart';
import 'package:flora/ui/flower_view.dart';
import 'package:flora/ui/login_page.dart';
import 'package:flora/utils/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Menu extends StatefulWidget {
  final StreamController<AuthenticationState> _streamController;

  Menu(this._streamController);

  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  DatabaseHelper db = DatabaseHelper();
  List<Flower> flowers = [];
  GlobalKey _globalKey = GlobalKey();

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  @override
  initState() {
    super.initState();
    _requestPermission();
    List<Flower> flowers = [
      Flower(
        "Цветочек",
        "Цветок",
        "Цветок",
        "assets/images/flowers/lily.png",
        ColorSwatch(Colors.blue.value, {
          'name': Colors.red[800],
          'description': Colors.black,
          'light': Colors.red[200],
          'main': Colors.red[900],
        }),
        DateTime(2020, 7, 1, 0, 0, 0, 0).toIso8601String(),
        0,
      ),
    ];
    List<Flower> savedFlowers;
    db.getAllFlowers().then((value) {
      savedFlowers = value;
      for (var f in flowers) {
        if (!savedFlowers.any((element) => element.name == f.name)){
          db.insertFlower(f);
        }
      }
    });
  }

  void onTap(BuildContext context, Flower f) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlowerView(f)));
    setState(() {
      f.seen = 1;
    });
    db.updateItem(f);
  }

  Widget _buildGrid(List<Widget> contents) => OrientationBuilder(
        builder: (context, orientation) => GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          padding: const EdgeInsets.all(4),
          children: contents,
          childAspectRatio: 0.7,
        ),
      );

  @override
  Widget build(BuildContext context) {
    db.getAllVisibleFlowers().then((value) => setState(() => flowers = value));
    return Scaffold(
        appBar: AppBar(
          title: Text("Flora"),
        ),
        body: _buildGrid(
          List.generate(
            flowers.length,
            (i) => Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: FlowerCard(flowers[i], onTap),
            ),
          ),
        ),
    );
  }
}
