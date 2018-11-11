import 'package:flutter/material.dart';
import './portraitOrientation.dart';
import './landscapeOrientation.dart';
import './waitingForConnectionScreen.dart';
import './serverSetup.dart' as serverSetup;
import './globals.dart' as globals;
import 'dart:async';

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
  bool isC = false;
  MyHomePageState(){
    serverSetup.serverSetup();

    new Timer.periodic(Duration(milliseconds: 1000), (Timer t) {
      setState(() {
        isC = globals.isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF1e1e1e),
      appBar: new AppBar(
        title: new Text('klas'),
        backgroundColor: Color(0xFF1e1e1e),
      ),
      body: LayoutBuilder(
        builder: (a,b){
          if(!isC){
            return WaitingForConnectionScreen();
          }else{
            return OrientationBuilder(
              builder: (context, orientation) {
                  return orientation == Orientation.portrait ? PortraitOrientation() : LandscapeOrientation();
              },
            );
          }
        },
      ),
    );
  }
}
