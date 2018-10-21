import 'package:flutter/material.dart';
import 'globals.dart' as globals;

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

  final Icon icon;
  final double width;
  final double height;
  final String direction;
  final EdgeInsetsGeometry position;

  @override
  _AwesomeButtonState createState() => _AwesomeButtonState();
}

class _AwesomeButtonState extends State<AwesomeButton> {
  Color color = Color(0xFF37373d);
  _hold(){
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = true; }
      if(widget.direction == 'backward'){ globals.backward = true; }
      if(widget.direction == 'left'){ globals.left = true; }
      if(widget.direction == 'right'){ globals.right = true; }
      color = Color(0xFF252526);
    });
  }

  _release(){
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = false; }
      if(widget.direction == 'backward'){ globals.backward = false; }
      if(widget.direction == 'left'){ globals.left = false; }
      if(widget.direction == 'right'){ globals.right = false; }
      color = Color(0xFF37373d);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (_) => _hold(),
      onTapUp: (_) => _release(),
      onTapCancel: () => _release(),
      child: new Container(
        decoration: new BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        margin: widget.position,
        width: widget.width,
        height: widget.height,
        child: new Center(
          child: widget.icon,
        ),
      ),
    );
  }
}