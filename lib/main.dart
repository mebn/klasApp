import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'dart:async';

import './portraitOrientation.dart';
import './landscapeOrientation.dart';
import 'globals.dart' as globals;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'klasApp',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  SocketIO socketIO;
  String moveFlutter;

  MyHomePageState(){
    // connecting to server
    socketIO = SocketIOManager().createSocketIO("http://10.0.0.1:8080", "/");
    socketIO.init();
    socketIO.connect();
    // sending commands to the server
    new Timer.periodic(Duration(milliseconds: 17), (Timer t) {
      setState(() {
        moveFlutter = '{forward:'+globals.forward.toString()+
        ',backward:'+globals.backward.toString()+
        ',left:'+globals.left.toString()+
        ',right:'+globals.right.toString()+
        '}';
      });
      socketIO.sendMessage("moveFlutter", moveFlutter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF1e1e1e),
      //appBar: new AppBar(
      //  title: new Text('klasApp'),
      //),
      body: new OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait ? PortraitOrientation() : LandscapeOrientation();
        },
      ),
    );
  }
}
