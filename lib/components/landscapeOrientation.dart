import 'package:flutter/material.dart';
import './awesomeButton.dart';

class LandscapeOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 30.0,
          left: 30.0,
          child: AwesomeButton(
            icon: Icons.arrow_upward,
            width: 130.0,
            height: 230.0,
            direction: 'forward',
          ),
        ),
        Positioned(
          bottom: 30.0,
          left: 190.0,
          child: AwesomeButton(
            icon: Icons.arrow_downward,
            width: 130.0,
            height: 180.0,
            direction: 'backward',
          ),
        ),
        Positioned(
          bottom: 30.0,
          right: 190.0,
          child: AwesomeButton(
            icon: Icons.arrow_back,
            width: 130.0,
            height: 130.0,
            direction: 'left',
          ),
        ),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: AwesomeButton(
            icon: Icons.arrow_forward,
            width: 130.0,
            height: 130.0,
            direction: 'right',
          ),
        ),
      ],
    );
  }
}