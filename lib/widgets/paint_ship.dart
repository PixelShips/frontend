import 'package:flutter/material.dart';

class PaintShip extends StatefulWidget {
  final provider;

  const PaintShip(this.provider);

  @override
  _PaintShipState createState() => _PaintShipState();
}

class _PaintShipState extends State<PaintShip> {
  Color setColor() {
    if (widget.provider.hit) {
      return Colors.yellow;
    } else if (widget.provider.sunk) {
      return Colors.black;
    } else {
      return widget.provider.color;
    }
  }

  String setText() {
    if (widget.provider.hit) {
      return 'Trafiony!';
    } else if (widget.provider.sunk) {
      return 'Zatopiony';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(setText())),
      decoration: BoxDecoration(
          color: setColor(), borderRadius: BorderRadius.circular(10)),
      width: widget.provider.width * 700,
      height: widget.provider.height * 700,
    );
  }
}
