import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BattleShipProvider extends GetxController {
  static BattleShipProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'Battleship';
  double width = 0.18;
  double get getWidth => this.width;

  double height = 0.04;
  double get getHeight => this.height;

  var color = Colors.blueGrey[800];
  get getColor => this.color;

  String get getName => this.name;

  double get getX => this.x;

  double get getY => this.y;

  set setX(newX) {
    x = newX;
    update();
  }

  set setY(newY) {
    x = newY;
    update();
  }
}
