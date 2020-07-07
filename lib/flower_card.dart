import 'package:flora/flower_view.dart';
import 'package:flutter/material.dart';

import 'models/flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower _flower;

  FlowerCard(this._flower);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlowerView(_flower))),
      child: Card(
        color: _flower.colors['light'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  _flower.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                _flower.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _flower.colors['name'],
                  fontSize: 20,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _flower.shortDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _flower.colors['description'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
