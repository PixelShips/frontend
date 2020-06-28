import 'package:flutter/material.dart';
import 'package:pixel_ships_web/widgets/paint_ship.dart';

class SetShipInfo extends StatefulWidget {
  final String nameOfBoat;
  final provider;

  SetShipInfo({this.nameOfBoat, this.provider});

  @override
  _SetShipInfoState createState() => _SetShipInfoState();
}

class _SetShipInfoState extends State<SetShipInfo> {
  final xTextController = TextEditingController();
  final yTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    xTextController.dispose();
    yTextController.dispose();
  }

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
                child: TextField(
                  controller: xTextController,
                  decoration: InputDecoration(
                      labelText:
                          'Wpisz współrzędne x dla statku${widget.provider.name}'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 20,
                child: TextField(
                  controller: yTextController,
                  decoration: InputDecoration(
                      labelText:
                          'Wpisz współrzędne y dla statku ${widget.provider.name}'),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Text('Postaw ${widget.nameOfBoat}'),
                    onPressed: () {
                      setState(() {
                        widget.provider.x = xTextController.value;
                        widget.provider.y = yTextController.value;
                      });
                    },
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
