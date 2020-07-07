import 'package:flutter/material.dart';

class Flower {
  int _id;
  String _name;
  String _shortDescription;
  String _description;
  String _image;
  ColorSwatch _colors;
  String _revealDate;
  int _seen;

  Flower(this._name, this._shortDescription, this._description, this._image, this._colors, this._revealDate, this._seen);

  Flower.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._shortDescription = obj['short'];
    this._description = obj['description'];
    this._image = obj['image'];
    this._colors = ColorSwatch(Colors.blue.value, {
      'name': Color(obj['color_name']),
      'description': Color(obj['color_description']),
      'light': Color(obj['color_light']),
      'main': Color(obj['color_main']),
    });
    this._revealDate = obj['reveal_date'];
    this._seen = obj['seen'];
  }

  Flower.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._shortDescription = map['short'];
    this._description = map['description'];
    this._image = map['image'];
    this._colors = ColorSwatch(Colors.blue.value, {
      'name': Color(map['color_name']),
      'description': Color(map['color_description']),
      'light': Color(map['color_light']),
      'main': Color(map['color_main']),
    });
    this._revealDate = map['reveal_date'];
    this._seen = map['seen'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();

    map['name'] = this._name;
    map['short'] = this._shortDescription;
    map['description'] = this._description;
    map['image'] = this._image;
    map['color_name'] = this._colors['name'].value;
    map['color_description'] = this._colors['description'].value;
    map['color_light'] = this._colors['light'].value;
    map['color_main'] = this._colors['main'].value;
    map['reveal_date'] = this._revealDate;
    map['seen'] = this._seen;

    if (id != null) map['id'] = this._id;

    return map;
  }

  get id => _id;
  set id(value) {
    _id = value;
  }

  get name => _name;
  set name(value) {
    _name = value;
  }

  get shortDescription => _shortDescription;
  set shortDescription(value) {
    _shortDescription = value;
  }

  get description => _description;
  set description(value) {
    _description = value;
  }

  get image => _image;
  set image(value) {
    _image = value;
  }

  get colors => _colors;
  set colors(value) {
    _colors = value;
  }

  get revealDate => _revealDate;
  set revealDate(value) {
    _revealDate = value;
  }

  get seen => _seen;
  set seen(value) {
    _seen = value;
  }
}
