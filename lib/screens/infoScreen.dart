import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Info", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Gymnasiearbete", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xFFB877B1))),
            Container(
              child: Column(
                children: <Widget>[
                  Text("Marcus Nilszén", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFB877B1))),
                  Text("William Muth", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFB877B1))),
                  Text("Richard Palm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFB877B1))),
                ],
              ),
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
