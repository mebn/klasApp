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

  _holdB(move, c){
    setState(() {
      move = true;
      c = Color(0xFF404b69);
    });
  }

  _releaseB(move, c){
    setState(() {
      move = false;
      c = Color(0xFF00818a);
    });
  }

  _connectSocket() {
    socketIO = new SocketIO("http://192.168.1.216:8080", "/");
    socketIO.init();
    socketIO.connect();
  }
  MyHomePageState(){
    new Timer.periodic(Duration(seconds:3), (Timer t) {
      setState(() {
        moveFlutter = '{forward:'+forward.toString()+',backward:'+backward.toString()+',left:'+left.toString()+',right:'+right.toString()+'}';
      });
      socketIO.sendMessage("event", moveFlutter);
    });
  }
  @override
  void initState() {
    super.initState();
    _connectSocket();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF283149),
      //appBar: new AppBar(
      //  title: new Text('klasApp'),
      //),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // backward
              new GestureDetector(
                onTapDown: (_) => _holdB(backward, cbackward),
                onTapUp: (_) => _releaseB(backward, cbackward),
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
                onTapDown: (_) => _holdB(forward, cforward),
                onTapUp: (_) => _releaseB(forward, cforward),
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
                onTapDown: (_) => _holdB(left, cleft),
                onTapUp: (_) => _releaseB(left, cleft),
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
                onTapDown: (_) => _holdB(right, cright),
                onTapUp: (_) => _releaseB(right, cright),
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
      ),
    );
  }
}
