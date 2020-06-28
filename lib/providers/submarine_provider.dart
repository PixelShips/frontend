import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmarineProvider extends GetxController {
  static SubmarineProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'Submarine';
  double width = 0.10;
  double height = 0.04;
  var color = Colors.lightBlue[800];
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
}
