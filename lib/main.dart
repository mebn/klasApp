import 'package:flutter/material.dart';
import './screens/homeScreen.dart';
import './serverSetup.dart' as serverSetup;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    serverSetup.connectToServer();
    return MaterialApp(
      title: 'controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}