import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeButtonModel {
  final String text;
  final IconData icon;
  final Color color;

  HomeButtonModel(
      {required this.text, required this.icon, required this.color});
}

final buttonModels = [
  HomeButtonModel(
    text: 'About',
    icon: CupertinoIcons.info,
    color: Colors.blue,
  ),
  HomeButtonModel(
    text: 'Schedule',
    icon: CupertinoIcons.list_bullet,
    color: Colors.green,
  ),
  HomeButtonModel(
    text: 'Location',
    icon: CupertinoIcons.map_pin_ellipse,
    color: Colors.yellow,
  ),
];
