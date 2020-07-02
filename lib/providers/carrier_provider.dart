import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_board_provider.dart';

class CarrierProvider extends GetxController {
  static CarrierProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'carrier';
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
}
