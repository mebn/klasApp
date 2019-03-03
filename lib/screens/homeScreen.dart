import 'package:flutter/material.dart';
import '../components/someButton.dart';
import './infoScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Shader shader = LinearGradient(colors: <Color>[Color(0xffb92b27), Color(0xff1565C0)])
      .createShader(Rect.fromLTWH(0.0, 0.0, 1000.0, 1000.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
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
            Text("Klas App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, foreground: Paint()..shader = shader)),
            SomeButton(),
          ],
        ),
      ),
    );
  }
}
