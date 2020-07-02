import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../providers/battleship_provider.dart';
import '../providers/carrier_provider.dart';
import '../providers/destroyer_provider.dart';
import '../providers/game_board_provider.dart';
import '../providers/patrolboat_provider.dart';
import '../providers/submarine_provider.dart';
import '../widgets/paint_ship_with_coordinates.dart';
import '../widgets/set_ship_info.dart';

class SetShips extends StatefulWidget {
  SetShips({Key key}) : super(key: key);

  @override
  _SetShipsState createState() => _SetShipsState();
}

class _SetShipsState extends State<SetShips> {
  var text = {};

  IO.Socket socket = IO.io('http://localhost:8000', <String, dynamic>{
    'transports': ['websocket'],
  });

  @override
  void initState() {
    super.initState();
    text = Get.arguments;
  }

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
                      Row(
                        children: [
                          RaisedButton(
                            child: Text('Kopiuj id gry'),
                            onPressed: () {
                              Clipboard.setData(
                                      ClipboardData(text: text['gameId']))
                                  .then((value) => Get.snackbar(
                                      'Powodzenie!', 'Skopiowano do schowka!'));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SelectableText(text['gameId']),
                          ),
                        ],
                      ),
                      GetBuilder<BattleShipProvider>(
                        init: BattleShipProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                            socket: socket,
                          );
                        },
                      ),
                      GetBuilder<SubmarineProvider>(
                        init: SubmarineProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                            socket: socket,
                          );
                        },
                      ),
                      GetBuilder<CarrierProvider>(
                        init: CarrierProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                            socket: socket,
                          );
                        },
                      ),
                      GetBuilder<DestroyerProvider>(
                        init: DestroyerProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                            socket: socket,
                          );
                        },
                      ),
                      GetBuilder<PatrolBoatProvider>(
                        init: PatrolBoatProvider(),
                        builder: (_) {
                          return SetShipInfo(
                            provider: _,
                            socket: socket,
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
