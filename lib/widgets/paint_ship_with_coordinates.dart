import 'package:flutter/material.dart';

class PaintShipWithCoordinates extends StatefulWidget {
  final provider;

  const PaintShipWithCoordinates({@required this.provider});

  @override
  _PaintShipWithCoordinatesState createState() =>
      _PaintShipWithCoordinatesState();
}

class _PaintShipWithCoordinatesState extends State<PaintShipWithCoordinates> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.provider.x,
      top: widget.provider.y,
      child: Container(
        decoration: BoxDecoration(
            color: widget.provider.color,
            borderRadius: BorderRadius.circular(10)),
        width: widget.provider.width * 700,
        height: widget.provider.height * 700,
      ),
    );
  }
}
