import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/someButton.dart';
import './infoScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Shader myGg = LinearGradient(
      colors: <Color>[Color(0xffb92b27), Color(0xff1565C0)],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Klas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, foreground: Paint()..shader = myGg)),
            SomeButton(
              width: 90.0,
              height: 90.0,
            ),
          ],
        ),
      ),
    );
  }
}
