import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import './globals.dart';
import 'dart:async';

void connectToServer() {
  String data;

  // server connection
  SocketIO socketIO = SocketIOManager().createSocketIO("http://10.0.0.1:8080", "/");
  socketIO.init();
  socketIO.connect();

  // send data to server every 10 milliseconds
  Timer.periodic(Duration(milliseconds: 10), (_) {
    data = "{forward:$forward,backward:$backward,left:$left,right:$right}";
    socketIO.sendMessage("move", data);
  });
}