import 'package:flora/database/database_helper.dart';
import 'package:flora/ui/flower_view.dart';
import 'package:flutter/material.dart';

import '../models/flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower _flower;
  Function(BuildContext context, Flower flower) _onTap;

  FlowerCard(this._flower, this._onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context, _flower),
      child: Card(
        color: _flower.colors['light'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: _flower.seen == 0
              ? BorderSide(color: Colors.amberAccent)
              : BorderSide.none,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
            if (_flower.seen == 0) Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      "NEW!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 20,
                      ),
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
