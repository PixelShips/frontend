import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GameBoardProvider extends GetxController {
  static GameBoardProvider get to => Get.find();

  double sideLength = 700;

  double shootSize = 0.1 * 700;

  List<List<double>> shootingCoordinates;

  List<List<double>> myShipsCoordinates;

  addToShooting(double x, double y) {
    shootingCoordinates.add([x, y]);
    update();
  }

  List<List<double>> get getShooting => shootingCoordinates;

  List<List<double>> get getShipsPosition => myShipsCoordinates;

  addToMyShips(double x, double y) {
    myShipsCoordinates.add([x, y]);
    update();
  }

  set setSideLength(double length) {
    sideLength = length;
    update();
  }

  var color = Colors.cyan[200];
  get getColor => this.color;

  double get getSideLength => sideLength;
}
