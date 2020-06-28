import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends GetxController {
  String url = 'http://localhost:8000';
  IO.Socket socket;
  var message;

  static SocketService get to => Get.find();

  @override
  onInit() {
    connect();
  }

  connect() {
    this.socket = IO.io(url, <String, dynamic>{
      'transports': ['websocket']
    });
    socket.connect();
  }

  emit(String event, Map<String, dynamic> json) {
    this.socket.emit(event, json);
  }

  hendleMessage() {
    this.socket.on('message', (data) {
      message = data;
    });
  }

  isConnect() {
    this.socket.on('connect', (_) {
      message = _;
    });
    return message;
  }
}
