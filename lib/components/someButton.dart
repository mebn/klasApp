import 'package:flutter/material.dart';
import '../screens/controllScreen.dart';

class SomeButton extends StatefulWidget {
  // props
  SomeButton({
    Key key,
    this.width,
    this.height
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _SomeButtonState createState() => _SomeButtonState();
}

class _SomeButtonState extends State<SomeButton> {
  Color outerColor = Colors.white;  
  _handleTapUp(){
    setState(() {
      outerColor = Colors.white;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControllScreen()),
    );
  }
  _handleTapDown(){
    setState(() {
      outerColor = Color(0xFFdadce0);
    });
  }

  _handleCancel(){
    setState(() {
      outerColor = Colors.white;
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
          border: Border.all(
            color: Color(0xFFdadce0),
            width: 1.0
          )
        ),
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Icon(Icons.crop_free, color: Color(0xFFB877B1), size: 40),
        ),
      ),
    );
  }
}