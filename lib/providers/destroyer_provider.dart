import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_board_provider.dart';

class DestroyerProvider extends GetxController {
  static DestroyerProvider get to => Get.find();

  bool isSet = false;

  bool hit = false;
  bool sunk = false;

  double x = 0;
  double y = 0;

  String name = 'destroyer';
  double width = 0.14;
  double height = 0.05;
  var color = Colors.lightGreen[700];
  get getColor => this.color;

  String get getName => this.name;

  double get getX => this.x;

  double get getY => this.y;

  set setX(newX) {
    x = newX;
    update();
  }

  set setY(newY) {
    y = newY;
    update();
  }

  double get maxX {
    return 700 - 700 * width;
  }

  double get maxY {
    return 700 - 700 * height;
  }

  double get minX {
    return (this.width / 2) * 700;
  }

  double get minY {
    return (this.height / 2) * 700;
  }

  double get xToPercent {
    return double.parse((this.x / GameBoardProvider.to.sideLength + width / 2)
        .toStringAsFixed(2));
  }

  double get yToPercent {
    return double.parse((this.y / GameBoardProvider.to.sideLength + height / 2)
        .toStringAsFixed(2));
  }

  set setIsSet(bool isset) {
    isSet = isset;
    update();
  }
}
