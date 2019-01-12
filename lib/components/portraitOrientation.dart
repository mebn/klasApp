import 'package:flutter/material.dart';
import './awesomeButton.dart';

class PortraitOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // forward
            AwesomeButton(
              icon: Icon(Icons.arrow_upward, color: Colors.black),
              width: 130.0,
              height: 230.0,
              position: EdgeInsets.only(top: 30.0, left: 30.0),
              direction: 'forward',
            ),
            // backward
            AwesomeButton(
              icon: Icon(Icons.arrow_downward, color: Colors.black),
              width: 130.0,
              height: 180.0,
              position: EdgeInsets.only(top: 80.0, right: 30.0),
              direction: 'backward',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // left
            AwesomeButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              width: 130.0,
              height: 130.0,
              position: EdgeInsets.only(bottom: 30.0, left: 30.0),
              direction: 'left',
            ),
            // right
            AwesomeButton(
              icon: Icon(Icons.arrow_forward, color: Colors.black),
              width: 130.0,
              height: 130.0,
              position: EdgeInsets.only(bottom: 30.0, right: 30.0),
              direction: 'right',
            ),
          ],
        ),
      ],
    );
  }
}