import 'package:flutter/material.dart';

class WaitingForConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Waiting for connection...", style: TextStyle(color: Colors.white, fontSize: 25.0),),
    );
  }
}