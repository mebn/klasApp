import 'package:flutter/material.dart';
import '../screens/controllScreen.dart';
import 'package:vibration/vibration.dart';

class SomeButton extends StatefulWidget {
  @override
  _SomeButtonState createState() => _SomeButtonState();
}

class _SomeButtonState extends State<SomeButton> {
  Color outerColor = Color(0xFF1A73E8);
  _handleTapUp(){
    setState(() {
      outerColor = Color(0xFF1A73E8);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControllScreen()),
    );
  }
  _handleTapDown(){
    setState(() {
      outerColor = Color(0xFF5F98F6);
    });
    Vibration.vibrate(duration: 10);
  }

  _handleCancel(){
    setState(() {
      outerColor = Color(0xFF1A73E8);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onTapCancel: () => _handleCancel(),
      child: Container(
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFBCC9FD),
              blurRadius: 10.0,
              offset: Offset(0.0, 3.0)
            ),
          ],
          // border: Border.all(
          //   color: Color(0xFFdadce0),
          //   width: 1.0
          // ),
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