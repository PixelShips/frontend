import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';

class ShootGameScreen extends StatefulWidget {
  ShootGameScreen({Key key}) : super(key: key);

  @override
  _ShootGameScreenState createState() => _ShootGameScreenState();
}

class _ShootGameScreenState extends State<ShootGameScreen> {
  double x = 0;
  double y = 0;
  List shoots = [];
  void showCoordinates(PointerEvent point) {
    setState(() {
      x = point.localPosition.dx;
      y = point.localPosition.dy;
    });
    shoots.add(PrintShoot(
      x: x,
      y: y,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Listener(
            onPointerDown: showCoordinates,
            child: Container(
              width: GameBoardProvider.to.sideLength,
              height: GameBoardProvider.to.sideLength,
              color: GameBoardProvider.to.color,
            ),
          ),
          ...shoots
        ],
      ),
    );
  }
}

class PrintShoot extends StatelessWidget {
  final x;
  final y;

  const PrintShoot({Key key, @required this.x, @required this.y})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y - GameBoardProvider.to.shootSize / 2,
      left: x - GameBoardProvider.to.shootSize / 2,
      child: Container(
        color: Colors.red,
        height: GameBoardProvider.to.shootSize,
        width: GameBoardProvider.to.shootSize,
      ),
    );
  }
}
