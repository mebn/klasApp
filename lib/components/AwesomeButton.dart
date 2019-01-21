import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../globals.dart' as globals;

class AwesomeButton extends StatefulWidget {
  // props
  AwesomeButton({
    Key key,
    this.icon,
    this.width,
    this.height,
    this.position,
    this.direction
  }) : super(key: key);

  final IconData icon;
  final double width;
  final double height;
  final EdgeInsetsGeometry position;
  final String direction;

  @override
  _AwesomeButtonState createState() => _AwesomeButtonState();
}

class _AwesomeButtonState extends State<AwesomeButton> {
  Color color = Color(0xFF1A73E8);
  _hold(){
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = true; }
      if(widget.direction == 'backward'){ globals.backward = true; }
      if(widget.direction == 'left'){ globals.left = true; }
      if(widget.direction == 'right'){ globals.right = true; }
      color = Color(0xFF5F98F6);
    });
    Vibration.vibrate(duration: 10);
  }

  _release(){
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = false; }
      if(widget.direction == 'backward'){ globals.backward = false; }
      if(widget.direction == 'left'){ globals.left = false; }
      if(widget.direction == 'right'){ globals.right = false; }
      color = Color(0xFF1A73E8);
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _hold(),
      onTapUp: (_) => _release(),
      onTapCancel: () => _release(),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(500.0)),
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
        margin: widget.position,
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Icon(widget.icon, color: Colors.white),
        ),
      ),
    );
  }
}