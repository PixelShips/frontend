import 'package:flutter/material.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';

class ShootGameScreen extends StatefulWidget {
  ShootGameScreen({Key key}) : super(key: key);

  @override
  _ShootGameScreenState createState() => _ShootGameScreenState();
}

class _ShootGameScreenState extends State<ShootGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        child: Stack(
          children: [
            Container(
              width: GameBoardProvider.to.sideLength,
              height: GameBoardProvider.to.sideLength,
              color: GameBoardProvider.to.color,
            )
          ],
        ),
      ),
    );
  }
}
