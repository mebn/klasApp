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
    this.direction
  }) : super(key: key);

  final IconData icon;
  final double width;
  final double height;
  final String direction;

  @override
  _AwesomeButtonState createState() => _AwesomeButtonState();
}

class _AwesomeButtonState extends State<AwesomeButton> with TickerProviderStateMixin {
  Color color = Color(0xff2879fe);
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }
  
  _hold(){
    _animationController.forward();
    Vibration.vibrate(duration: 10);
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = true; }
      if(widget.direction == 'backward'){ globals.backward = true; }
      if(widget.direction == 'left'){ globals.left = true; }
      if(widget.direction == 'right'){ globals.right = true; }
      // color = Color(0xff95bcff);
    });
  }

  _release(){
    _animationController.reverse();
    setState(() {
      if(widget.direction == 'forward'){ globals.forward = false; }
      if(widget.direction == 'backward'){ globals.backward = false; }
      if(widget.direction == 'left'){ globals.left = false; }
      if(widget.direction == 'right'){ globals.right = false; }
      // color = Color(0xff2879fe);
    });
  }
  @override
  Widget build(BuildContext context) {
    double scale = 1 - _animationController.value;
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTapDown: (_) => _hold(),
        onTapUp: (_) => _release(),
        onTapCancel: () => _release(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(500.0),
          ),
          width: widget.width,
          height: widget.height,
          child: Center(
            child: Icon(widget.icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}