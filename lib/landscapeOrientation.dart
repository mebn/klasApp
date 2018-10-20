import 'package:flutter/material.dart';
import 'AwesomeButton.dart';

class LandscapeOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // forward
                AwesomeButton(
                  icon: new Icon(IconData(0xe5d8, fontFamily: 'MaterialIcons')),
                  width: 100.0,
                  height: 200.0,
                  position: EdgeInsets.only(bottom: 30.0, left: 30.0),
                  direction: 'forward',
                ),
                // backward
                AwesomeButton(
                  icon: new Icon(IconData(0xe5db, fontFamily: 'MaterialIcons')),
                  width: 100.0,
                  height: 150.0,
                  position: EdgeInsets.only(bottom: 30.0, left: 30.0),
                  direction: 'backward',
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // left
                AwesomeButton(
                  icon: new Icon(IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                  width: 100.0,
                  height: 100.0,
                  position: EdgeInsets.only(bottom: 30.0, right: 30.0),
                  direction: 'left',
                ),
                // right
                AwesomeButton(
                  icon: new Icon(IconData(0xe5c8, fontFamily: 'MaterialIcons', matchTextDirection: true)),
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