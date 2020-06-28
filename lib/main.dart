import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_ships_web/services/socket_service.dart';

import 'providers/battleship_provider.dart';
import 'providers/carrier_provider.dart';
import 'providers/destroyer_provider.dart';
import 'providers/patrolboat_provider.dart';
import 'providers/submarine_provider.dart';
import 'screens/init_game.dart';

void main() {
  Get.put<BattleShipProvider>(BattleShipProvider());
  Get.put<CarrierProvider>(CarrierProvider());
  Get.put<DestroyerProvider>(DestroyerProvider());
  Get.put<PatrolBoatProvider>(PatrolBoatProvider());
  Get.put<SubmarineProvider>(SubmarineProvider());
  Get.put<SocketService>(SocketService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlayerScreen(),
    );
  }
}
