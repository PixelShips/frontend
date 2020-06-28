import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GameBoardProvider extends GetxController {
  static GameBoardProvider get to => Get.find();

  double sideLength;

  set setSideLength(double length) {
    sideLength = length;
    update();
  }

  var color = Colors.cyan[200];
  get getColor => this.color;

  double get getSideLength => sideLength;
}
