import 'package:flutter/material.dart';
import 'package:pixel_ships_web/providers/battleship_provider.dart';
import 'package:pixel_ships_web/providers/carrier_provider.dart';
import 'package:pixel_ships_web/providers/destroyer_provider.dart';
import 'package:pixel_ships_web/providers/patrolboat_provider.dart';
import 'package:pixel_ships_web/providers/submarine_provider.dart';
import 'package:pixel_ships_web/widgets/set_ship_info.dart';
import 'package:get/get.dart';

class SetShips extends StatefulWidget {
  SetShips({Key key}) : super(key: key);

  @override
  _SetShipsState createState() => _SetShipsState();
}

class _SetShipsState extends State<SetShips> {
  final battleShipProvider = BattleShipProvider.to;
  @override
  Widget build(BuildContext context) {
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
                      GetBuilder<BattleShipProvider>(
                        init: BattleShipProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            nameOfBoat: _.name,
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<SubmarineProvider>(
                        init: SubmarineProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            nameOfBoat: _.name,
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<CarrierProvider>(
                        init: CarrierProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            nameOfBoat: _.name,
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<DestroyerProvider>(
                        init: DestroyerProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            nameOfBoat: _.name,
                            provider: _,
                          );
                        },
                      ),
                      GetBuilder<PatrolBoatProvider>(
                        init: PatrolBoatProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            nameOfBoat: _.name,
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
                    color: Colors.indigo[400],
                    width: 700,
                    height: 700,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
