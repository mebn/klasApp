import 'package:flutter/material.dart';
import './screens/homeScreen.dart';
import './serverSetup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    connectToServer();
    return MaterialApp(
      title: 'klas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'ProductSans'
      ),
      home: HomeScreen(),
    );
  }
}