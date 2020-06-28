import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatrolBoatProvider extends GetxController {
  static PatrolBoatProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'PatrolBoat';
  double width = 0.06;
  double height = 0.03;
  var color = Colors.blue[900];
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
