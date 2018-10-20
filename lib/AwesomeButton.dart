import 'package:flutter/material.dart';

class AwesomeButton extends StatefulWidget {
  @override
  _AwesomeButtonState createState() => _AwesomeButtonState();
}

class _AwesomeButtonState extends State<AwesomeButton> {
  Color color;
  _holdB(){
    setState(() {
      color = Color(0xFF252526);
    });
  }

  _releaseB(){
    setState(() {
      color = Color(0xFF37373d);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (_) => _holdB(),
      onTapUp: (_) => _releaseB(),
      onTapCancel: () => _releaseB(),
      child: new Container(
        decoration: new BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        margin: EdgeInsets.only(top: 30.0, left: 30.0),
        width: 100.0,
        height: 200.0,
        child: new Center(
          child: new Icon(IconData(0xe5d8, fontFamily: 'MaterialIcons')),
        ),
      ),
    );
  }
}