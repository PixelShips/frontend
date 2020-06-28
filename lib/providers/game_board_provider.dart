import 'package:get/get.dart';

class GameBoardProvider extends GetxController {
  static GameBoardProvider get to => Get.find();

  double sideLength;

  set setSideLength(double length) {
    sideLength = length;
    update();
  }

  double get getSideLength => sideLength;
}
