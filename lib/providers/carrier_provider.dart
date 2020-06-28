import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrierProvider extends GetxController {
  static CarrierProvider get to => Get.find();

  double x;
  double y;

  String name = 'Carrier';
  double width = 0.2;
  double height = 0.05;

  var color = Colors.cyan[700];
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
