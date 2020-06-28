import 'package:flutter/material.dart';

class PaintShip extends StatelessWidget {
  final provider;

  const PaintShip(this.provider);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: provider.color, borderRadius: BorderRadius.circular(10)),
      width: provider.width * 700,
      height: provider.height * 700,
    );
  }
}
