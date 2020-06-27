import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  String url = 'http://localhost:8000';
  IO.Socket socket;

  SocketService([url]) {
    this.socket = IO.io(url, <String, dynamic> {
      'transports': ['websocket']
    });
  }
  
  emit(String event, Map<String, dynamic> json) {
    this.socket.emit(event,  json);
  }

  hendleMessage() {
    this.socket.on('message', (data) => data);
  }

  String isConnect() {
    this.socket.on('connect', (_) => 'connect');
  }
}