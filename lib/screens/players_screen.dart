import 'package:flutter/material.dart';

class PlayersScreen extends StatefulWidget {
  PlayersScreen({Key key}) : super(key: key);

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Players'),
    );
  }
}