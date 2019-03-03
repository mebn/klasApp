import 'package:flutter/material.dart';
import '../screens/controllScreen.dart';

class SomeButton extends StatefulWidget {
  @override
  _SomeButtonState createState() => _SomeButtonState();
}

class _SomeButtonState extends State<SomeButton> with TickerProviderStateMixin {
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
    // setState(() {
    //   color = Color(0xff95bcff);
    // });
  }

  _release(){
    _animationController.reverse();
    // setState(() {
    //   color = Color(0xff2879fe);
    // });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControllScreen()),
    );
  }

  _cancel(){
    _animationController.reverse();
    // setState(() {
    //   color = Color(0xff2879fe);
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    double scale = 1 - _animationController.value;
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTapDown: (_) => _hold(),
        onTapUp: (_) => _release(),
        onTapCancel: () => _cancel(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(500.0),
          ),
          width: 130.0,
          height: 70.0,
          child: Center(
            child: Icon(Icons.crop_free, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}