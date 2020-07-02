import 'package:flutter/material.dart';
import 'package:pixel_ships_web/providers/battleship_provider.dart';
import 'package:pixel_ships_web/providers/carrier_provider.dart';
import 'package:pixel_ships_web/providers/destroyer_provider.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';
import 'package:pixel_ships_web/providers/patrolboat_provider.dart';
import 'package:pixel_ships_web/providers/submarine_provider.dart';
import 'package:pixel_ships_web/widgets/paint_ship_with_coordinates.dart';

class GameScreenShips extends StatefulWidget {
  GameScreenShips({Key key}) : super(key: key);

  @override
  _GameScreenShipsState createState() => _GameScreenShipsState();
}

class _GameScreenShipsState extends State<GameScreenShips> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: GameBoardProvider.to.sideLength,
            width: GameBoardProvider.to.sideLength,
            color: GameBoardProvider.to.color,
          ),
          PaintShipWithCoordinates(
            provider: BattleShipProvider.to,
          ),
          PaintShipWithCoordinates(
            provider: CarrierProvider.to,
          ),
          PaintShipWithCoordinates(
            provider: DestroyerProvider.to,
          ),
          PaintShipWithCoordinates(
            provider: PatrolBoatProvider.to,
          ),
          PaintShipWithCoordinates(
            provider: SubmarineProvider.to,
          ),
        ],
      ),
    );
  }
}
