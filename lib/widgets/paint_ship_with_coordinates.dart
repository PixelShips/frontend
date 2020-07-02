import 'package:flutter/material.dart';
import 'package:pixel_ships_web/widgets/paint_ship.dart';

class PaintShipWithCoordinates extends StatelessWidget {
  final provider;

  const PaintShipWithCoordinates({@required this.provider});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: provider.x, top: provider.y, child: PaintShip(provider));
  }
}
