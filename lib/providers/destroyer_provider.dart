import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestroyerProvider extends GetxController {
  static DestroyerProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'Destroyer';
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
}
