import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_ships_web/providers/game_board_provider.dart';
import 'package:pixel_ships_web/screens/my_game_screen.dart';
import 'package:pixel_ships_web/screens/shoot_game_screen.dart';
import 'package:pixel_ships_web/services/socket_service.dart';

import 'providers/battleship_provider.dart';
import 'providers/carrier_provider.dart';
import 'providers/destroyer_provider.dart';
import 'providers/patrolboat_provider.dart';
import 'providers/submarine_provider.dart';
import 'screens/init_game_screen.dart';
import 'screens/set_ships_screen.dart';

void main() {
  Get.put<BattleShipProvider>(BattleShipProvider());
  Get.put<CarrierProvider>(CarrierProvider());
  Get.put<DestroyerProvider>(DestroyerProvider());
  Get.put<PatrolBoatProvider>(PatrolBoatProvider());
  Get.put<SubmarineProvider>(SubmarineProvider());
  Get.put<SocketService>(SocketService());
  Get.put<GameBoardProvider>(GameBoardProvider());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/setShips', page: () => SetShips()),
        GetPage(name: '/my-game-ships', page: () => GameScreenShips()),
        GetPage(name: '/shoot-game-screen', page: () => ShootGameScreen())
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlayerScreen(),
    );
  }
}
