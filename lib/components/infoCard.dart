import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  // props
  InfoCard({
    Key key,
    this.children,
  }) : super(key: key);

  final List<Widget> children;
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //   border: Border.all(
      //     color: Color(0xFFdadce0),
      //     width: 1.0
      //   )
      // ),
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.children,
        ),
      ),
    );
  }
}
