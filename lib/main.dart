import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/homeScreen.dart';
import './serverSetup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xff212121),
      systemNavigationBarColor: Color(0xff212121),
    ));
    connectToServer();
    return MaterialApp(
      title: 'klas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'ProductSans',
        scaffoldBackgroundColor: Color(0xff212121),
        primaryColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}