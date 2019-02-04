import 'package:flutter/material.dart';
import '../components/portraitOrientation.dart';
import '../components/landscapeOrientation.dart';

class ControllScreen extends StatefulWidget {
  ControllScreen({Key key}) : super(key: key);
  @override
  _ControllScreenState createState() => _ControllScreenState();
}

class _ControllScreenState extends State<ControllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xff212121),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
            return orientation == Orientation.portrait ? PortraitOrientation() : LandscapeOrientation();
        },
      ),
    );
  }
}
