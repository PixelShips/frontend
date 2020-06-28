import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final textControllerGame = TextEditingController();
  final textControllerId = TextEditingController();

  IO.Socket socket = IO.io('http://localhost:8000', <String, dynamic>{
    'transports': ['websocket'],
  });

  @override
  void dispose() {
    super.dispose();
    textControllerGame.dispose();
    textControllerId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var message;
    String name;
    return Scaffold(
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            RaisedButton(
              child: Text('Stwórz nową grę'),
              onPressed: () {
                setState(() {
                  name = textControllerGame.text;
                });
                var data = {"name": name};

                socket.emit('create-game', data);
                socket.on('message', (_) {
                  message = _;
                });
                // Get.toNamed()
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textControllerGame,
                decoration: InputDecoration(labelText: 'Nazwa gry'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Dołącz do gry'),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textControllerId,
                decoration: InputDecoration(labelText: 'ID gry'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
