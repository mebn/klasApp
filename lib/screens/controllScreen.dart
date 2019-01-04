import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/portraitOrientation.dart';
import '../components/landscapeOrientation.dart';
import '../serverSetup.dart' as serverSetup;
import '../globals.dart' as globals;

class ControllScreen extends StatefulWidget {
  ControllScreen({Key key}) : super(key: key);
  @override
  _ControllScreenState createState() => _ControllScreenState();
}

class _ControllScreenState extends State<ControllScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));
    serverSetup.connectToServer();
    return Scaffold(
      appBar: AppBar(
        title: Text("KLAS", style: TextStyle(color: globals.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 1.0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
            return orientation == Orientation.portrait ? PortraitOrientation() : LandscapeOrientation();
        },
      ),
    );
  }
}
