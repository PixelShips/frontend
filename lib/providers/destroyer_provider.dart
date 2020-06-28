import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestroyerProvider extends GetxController {
  static DestroyerProvider get to => Get.find();

  double x;
  double y;

  String name = 'Destroyer';
  double width = 0.14;
  double height = 0.05;
  var color = Colors.blueGrey[100];
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
