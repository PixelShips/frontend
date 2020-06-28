import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pixel_ships_web/providers/battleship_provider.dart';
import 'package:pixel_ships_web/providers/carrier_provider.dart';
import 'package:pixel_ships_web/providers/destroyer_provider.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';
import 'package:pixel_ships_web/providers/patrolboat_provider.dart';
import 'package:pixel_ships_web/providers/submarine_provider.dart';
import 'package:pixel_ships_web/widgets/paint_ship_with_coordinates.dart';
import 'package:pixel_ships_web/widgets/set_ship_info.dart';
import 'package:get/get.dart';

class SetShips extends StatefulWidget {
  SetShips({Key key}) : super(key: key);

  @override
  _SetShipsState createState() => _SetShipsState();
}

class _SetShipsState extends State<SetShips> {
  var text = 'q';

  @override
  void initState() {
    super.initState();
    text = Get.arguments;
  }

  final battleShipProvider = BattleShipProvider.to;
  @override
  Widget build(BuildContext context) {
    // Get.snackbar( SnackBar(content: SelectableText(text),));
    // Get.dialog();

    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width * 0.85,
          height: Get.height * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  height: 700,
                  width: 400,
                  child: Column(
                    children: [
                      SelectableText(text),
                      GetBuilder<BattleShipProvider>(
                        init: BattleShipProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<SubmarineProvider>(
                        init: SubmarineProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<CarrierProvider>(
                        init: CarrierProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<DestroyerProvider>(
                        init: DestroyerProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<PatrolBoatProvider>(
                        init: PatrolBoatProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    color: GameBoardProvider.to.color,
                    width: 700,
                    height: 700,
                  ),
                  GetBuilder<BattleShipProvider>(
                    init: BattleShipProvider(),
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  ),
                  GetBuilder<BattleShipProvider>(
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  ),
                  GetBuilder<SubmarineProvider>(
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  ),
                  GetBuilder<CarrierProvider>(
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  ),
                  GetBuilder<DestroyerProvider>(
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  ),
                  GetBuilder<PatrolBoatProvider>(
                    builder: (_) {
                      return PaintShipWithCoordinates(
                        provider: _,
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
