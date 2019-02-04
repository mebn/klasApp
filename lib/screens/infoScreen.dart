import 'package:flutter/material.dart';
import '../components/infoCard.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextStyle title = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
  TextStyle text = TextStyle(fontSize: 16, color: Color(0xff8d8d8d));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
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
      body: ListView(
        children: <Widget>[
          InfoCard(
            children: <Widget>[
              Text("Användning", style: title),
              Text("1. Starta raspberry pi", style: text),
              Text("2. Anslut till klas", style: text),
              Text("3. Öppna kontrollerna i appen och kör!", style: text),
            ],
          ),
          InfoCard(
            children: <Widget>[
              Text("Om klas", style: title),
              Text("Klas är ett gymnasiearbete som går ut på att göra en raspberry pi robot som man kan styra med en app.", style: text),              
            ],
          ),
          InfoCard(
            children: <Widget>[
              Text("Gruppmedlemmar", style: title),
              Text("Marcus Nilszén", style: text),
              Text("William Muth", style: text),
              Text("Richard Palm", style: text),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
          ),
        ],
      ),
    );
  }
}
