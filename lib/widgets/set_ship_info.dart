import 'package:flutter/material.dart';
import 'package:pixel_ships_web/screens/set_ships.dart';
import 'package:pixel_ships_web/widgets/paint_ship.dart';

class SetShipInfo extends StatefulWidget {
  final provider;

  SetShipInfo({this.provider});

  @override
  _SetShipInfoState createState() => _SetShipInfoState();
}

class _SetShipInfoState extends State<SetShipInfo> {
  double valueX = 0;
  double valueY = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 20,
                child: Slider(
                  value: valueX,
                  min: 0,
                  max: widget.provider.maxX,
                  onChanged: (value) {
                    setState(() {
                      valueX = value;
                      widget.provider.setX = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 20,
                child: Slider(
                  value: valueY,
                  min: 0,
                  max: widget.provider.maxY,
                  onChanged: (value) {
                    setState(() {
                      widget.provider.setY = value;
                      valueY = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: widget.provider.color,
                    onPressed: () {},
                    child: Text(
                      'Postaw ${widget.provider.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[50]),
                    ),
                  ),
                  PaintShip(widget.provider)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
