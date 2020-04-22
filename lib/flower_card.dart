import 'package:flutter/material.dart';

import 'flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower _flower;

  FlowerCard(this._flower);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey,
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
              flex: 4,
              child: Text(
                _flower.name,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
