import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import './portraitOrientation.dart';
import './landscapeOrientation.dart';
import './serverSetup.dart' as serverSetup;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'klas',
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
  MyHomePageState(){
    serverSetup.serverSetup();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF1e1e1e),
      // appBar: new AppBar(
      //  title: new Text('klas'),
      // ),
      body: new OrientationBuilder(
        builder: (context, orientation) {
          // check for orientation
          return orientation == Orientation.portrait ? PortraitOrientation() : LandscapeOrientation();
        },
      ),
    );
  }
}
