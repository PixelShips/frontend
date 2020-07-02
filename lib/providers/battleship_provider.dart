import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';

class BattleShipProvider extends GetxController {
  static BattleShipProvider get to => Get.find();

  double x = 0;
  double y = 0;

  String name = 'battleship';
  double width = 0.18;
  double get getWidth => this.width;

  double height = 0.04;
  double get getHeight => this.height;

  var color = Colors.blueGrey[800];
  get getColor => this.color;

  String get getName => this.name;

  double get getX => this.x;

  double get getY => this.y;

  double get xToPercent {
    return double.parse((this.x / GameBoardProvider.to.sideLength + width / 2)
        .toStringAsFixed(2));
  }

  double get yToPercent {
    return double.parse((this.y / GameBoardProvider.to.sideLength + height / 2)
        .toStringAsFixed(2));
  }

  double get maxX {
    return 700 - 700 * width / 2;
  }

  double get maxY {
    return 700 - 700 * height / 2;
  }

  double get minX {
    return (this.width / 2) * 700;
  }

  double get minY {
    return (this.height / 2) * 700;
  }

  set setX(newX) {
    x = newX;
    update();
  }

  set setY(newY) {
    y = newY;
    update();
  }
}
