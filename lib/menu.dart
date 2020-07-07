import 'package:flora/database/database_helper.dart';
import 'package:flora/models/flower.dart';
import 'package:flora/flower_card.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  DatabaseHelper db = DatabaseHelper();
  List<Flower> flowers = [];

  @override
  initState() {
    super.initState();
    List<Flower> flowers = [
      Flower(
        "Цветочек",
        "Цветок",
        "Цветок",
        "assets/images/flowers/flower.png",
        ColorSwatch(Colors.blue.value, {
          'name': Colors.blue,
          'description': Colors.black,
          'light': Colors.blue[50],
          'main': Colors.blue[300],
        }),
        DateTime(2020, 1, 1, 0, 0, 0, 0).toIso8601String(),
        0,
      ),
      Flower(
        "Тюльпан",
        "Твой любимый цветок",
        "Ты говорила, что тюльпан -- это твой любимый цветок. Он также является и одним из моих любимых. Мне очень нравится наблюдать за тем, как он день ото дня становится всё прекраснее: постепенно раскрывается и обнажает свою красоту, пускает заглянуть вовнутрь, но не сразу, прямо как ты. \n\nНа самом деле, цветы в мировых культурах имели символическое значение, но мы стали забывать этот тайный язык цветов. А мне он кажется очень романтичным. По традиции красный тюльпан обозначает неугасимую страсть и любовь, и также поэтому мне хочется первым отправить тебе этот цветок, чтобы передать те чувства, которые я к тебе испытываю.",
        "assets/images/flowers/tulip.png",
        ColorSwatch(Colors.pink.value, {
          'name': Colors.pink,
          'description': Colors.black,
          'light': Color(0xfff2c9d0),
          'main': Color(0xffae1f23),
        }),
        DateTime(2020, 2, 1, 0, 0, 0, 0).toIso8601String(),
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
    db.getAllFlowers().then((value) => setState(() => flowers = value));
    return Scaffold(
      appBar: AppBar(
        title: Text("Flora"),
      ),
      body: _buildGrid(
        List.generate(
          flowers.length,
          (i) => Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: FlowerCard(flowers[i]),
          ),
        ),
      ),
    );
  }
}
