import 'package:flutter/material.dart';
import 'AwesomeButton.dart';

class LandscapeOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // forward
                AwesomeButton(
                  icon: Icon(Icons.arrow_upward, color: Colors.black),
                  width: 100.0,
                  height: 200.0,
                  position: EdgeInsets.only(bottom: 30.0, left: 30.0),
                  direction: 'forward',
                ),
                // backward
                AwesomeButton(
                  icon: Icon(Icons.arrow_downward, color: Colors.black),
                  width: 100.0,
                  height: 150.0,
                  position: EdgeInsets.only(bottom: 30.0, left: 30.0),
                  direction: 'backward',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // left
                AwesomeButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  width: 100.0,
                  height: 100.0,
                  position: EdgeInsets.only(bottom: 30.0, right: 30.0),
                  direction: 'left',
                ),
                // right
                AwesomeButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.black),
                  width: 100.0,
                  height: 100.0,
                  position: EdgeInsets.only(bottom: 30.0, right: 30.0),
                  direction: 'right',
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}