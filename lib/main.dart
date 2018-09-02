import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'klasApp',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  SocketIO socketIO;
  bool forward = false;
  bool backward = false;
  bool left = false;
  bool right = false;
  String moveFlutter;

  Color cforward = Color(0xFF00818a);
  Color cbackward = Color(0xFF00818a);
  Color cleft = Color(0xFF00818a);
  Color cright = Color(0xFF00818a);

  _holdB(String id){
    setState(() {
      if(id == 'backward'){
        backward = true;
        cbackward = Color(0xFF404b69);
      }
      if(id == 'forward'){
        forward = true;
        cforward = Color(0xFF404b69);
      }
      if(id == 'left'){
        left = true;
        cleft = Color(0xFF404b69);
      }
      if(id == 'right'){
        right = true;
        cright = Color(0xFF404b69);
      }
    });
  }

  _releaseB(String id){
    setState(() {
      if(id == 'backward'){
        backward = false;
        cbackward = Color(0xFF00818a);
      }
      if(id == 'forward'){
        forward = false;
        cforward = Color(0xFF00818a);
      }
      if(id == 'left'){
        left = false;
        cleft = Color(0xFF00818a);
      }
      if(id == 'right'){
        right = false;
        cright = Color(0xFF00818a);
      }
    });
  }

  _connectSocket() {
    socketIO = new SocketIO("http://192.168.1.216:8080", "/");
    socketIO.init();
    socketIO.connect();
  }

  MyHomePageState(){
    _connectSocket();
    new Timer.periodic(Duration(milliseconds: 17), (Timer t) {
      setState(() {
        moveFlutter = '{forward:'+forward.toString()+',backward:'+backward.toString()+',left:'+left.toString()+',right:'+right.toString()+'}';
      });
      socketIO.sendMessage("event", moveFlutter);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF283149),
      //appBar: new AppBar(
      //  title: new Text('klasApp'),
      //),
      body: new OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // backward
                    new GestureDetector(
                      onTapDown: (_) => _holdB('backward'),
                      onTapUp: (_) => _releaseB('backward'),
                      onTapCancel: () => _releaseB('backward'),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: cbackward,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        margin: EdgeInsets.only(top: 80.0, left: 30.0),
                        width: 100.0,
                        height: 150.0,
                      ),
                    ),
                    // forward
                    new GestureDetector(
                      onTapDown: (_) => _holdB('forward'),
                      onTapUp: (_) => _releaseB('forward'),
                      onTapCancel: () => _releaseB('backward'),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: cforward,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        margin: EdgeInsets.only(top: 30.0, right: 30.0),
                        width: 100.0,
                        height: 200.0,
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // left
                    new GestureDetector(
                      onTapDown: (_) => _holdB('left'),
                      onTapUp: (_) => _releaseB('left'),
                      onTapCancel: () => _releaseB('backward'),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: cleft,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    // right
                    new GestureDetector(
                      onTapDown: (_) => _holdB('right'),
                      onTapUp: (_) => _releaseB('right'),
                      onTapCancel: () => _releaseB('backward'),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: cright,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          // landscape
          else {
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
                        // left
                        new GestureDetector(
                          onTapDown: (_) => _holdB('left'),
                          onTapUp: (_) => _releaseB('left'),
                          onTapCancel: () => _releaseB('backward'),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: cleft,
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        // right
                        new GestureDetector(
                          onTapDown: (_) => _holdB('right'),
                          onTapUp: (_) => _releaseB('right'),
                          onTapCancel: () => _releaseB('backward'),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: cright,
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // backward
                        new GestureDetector(
                          onTapDown: (_) => _holdB('backward'),
                          onTapUp: (_) => _releaseB('backward'),
                          onTapCancel: () => _releaseB('backward'),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: cbackward,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                            width: 100.0,
                            height: 150.0,
                          ),
                        ),
                        // forward
                        new GestureDetector(
                          onTapDown: (_) => _holdB('forward'),
                          onTapUp: (_) => _releaseB('forward'),
                          onTapCancel: () => _releaseB('backward'),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: cforward,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                            width: 100.0,
                            height: 200.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
