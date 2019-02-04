import 'package:flutter/material.dart';
import '../screens/controllScreen.dart';
import 'package:vibration/vibration.dart';

class SomeButton extends StatefulWidget {
  @override
  _SomeButtonState createState() => _SomeButtonState();
}

class _SomeButtonState extends State<SomeButton> {
  Color outerColor = Color(0xff2879fe);

  _hold(){
    setState(() {
      outerColor = Color(0xff95bcff);
    });
    Vibration.vibrate(duration: 10);
  }

  _release(){
    setState(() {
      outerColor = Color(0xff2879fe);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControllScreen()),
    );
  }

  _cancel(){
    setState(() {
      outerColor = Color(0xff2879fe);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _hold(),
      onTapUp: (_) => _release(),
      onTapCancel: () => _cancel(),
      child: Container(
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        width: 130.0,
        height: 70.0,
        child: Center(
          child: Icon(Icons.crop_free, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}