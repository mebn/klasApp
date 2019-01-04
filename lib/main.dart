import 'package:flutter/material.dart';
import './screens/controllScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControllScreen(),
    );
  }
}