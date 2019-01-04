import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import './globals.dart' as globals;
import 'dart:async';

void connectToServer() {
  SocketIO socketIO;
  String moveFlutter;
  // server connection
  socketIO = SocketIOManager().createSocketIO("http://10.0.0.1:8080", "/");
  socketIO.init();
  socketIO.connect();
  // timer to send data to server
  new Timer.periodic(Duration(milliseconds: 10), (Timer t) {
    // string -> json on server
    moveFlutter = '{forward:'+globals.forward.toString()+
    ',backward:'+globals.backward.toString()+
    ',left:'+globals.left.toString()+
    ',right:'+globals.right.toString()+
    '}';

    socketIO.sendMessage("moveFlutter", moveFlutter);
  });
}