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
  String moveFlutter;
  // forward, backward, left, right
  List<bool> directions = [false, false, false, false];
  List<Color> colors = [Color(0xFF00818a), Color(0xFF00818a), Color(0xFF00818a), Color(0xFF00818a)];

  _holdB(int id){
    setState(() {
      directions[id] = true;
      colors[id] = Color(0xFF404b69);
    });
  }

  _releaseB(int id){
    setState(() {
      directions[id] = false;
      colors[id] = Color(0xFF00818a);
    });
  }

  MyHomePageState(){
    // connecting to server
    socketIO = new SocketIO("http://10.0.0.1:8080", "/");
    socketIO.init();
    socketIO.connect();
    // sending command to the server at 60fps
    new Timer.periodic(Duration(milliseconds: 17), (Timer t) {
      setState(() {
        moveFlutter = '{forward:'+directions[0].toString()+
        ',backward:'+directions[1].toString()+
        ',left:'+directions[2].toString()+
        ',right:'+directions[3].toString()+
        '}';
      });
      socketIO.sendMessage("moveFlutter", moveFlutter);
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
                    // forward
                    new GestureDetector(
                      onTapDown: (_) => _holdB(0),
                      onTapUp: (_) => _releaseB(0),
                      onTapCancel: () => _releaseB(0),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(top: 30.0, left: 30.0),
                        width: 100.0,
                        height: 200.0,
                        child: new Center(
                          child: new Icon(IconData(0xe5d8, fontFamily: 'MaterialIcons')),
                        ),
                      ),
                    ),
                    // backward
                    new GestureDetector(
                      onTapDown: (_) => _holdB(1),
                      onTapUp: (_) => _releaseB(1),
                      onTapCancel: () => _releaseB(1),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: colors[1],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(top: 80.0, right: 30.0),
                        width: 100.0,
                        height: 150.0,
                        child: new Center(
                          child: new Icon(IconData(0xe5db, fontFamily: 'MaterialIcons')),
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // left
                    new GestureDetector(
                      onTapDown: (_) => _holdB(2),
                      onTapUp: (_) => _releaseB(2),
                      onTapCancel: () => _releaseB(2),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: colors[2],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                        width: 100.0,
                        height: 100.0,
                        child: new Center(
                          child: new Icon(IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                        ),
                      ),
                    ),
                    // right
                    new GestureDetector(
                      onTapDown: (_) => _holdB(3),
                      onTapUp: (_) => _releaseB(3),
                      onTapCancel: () => _releaseB(3),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: colors[3],
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                        width: 100.0,
                        height: 100.0,
                        child: new Center(
                          child: new Icon(IconData(0xe5c8, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                        ),
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
                        // forward
                        new GestureDetector(
                          onTapDown: (_) => _holdB(0),
                          onTapUp: (_) => _releaseB(0),
                          onTapCancel: () => _releaseB(0),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: colors[0],
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                            width: 100.0,
                            height: 200.0,
                            child: new Center(
                              child: new Icon(IconData(0xe5d8, fontFamily: 'MaterialIcons')),
                            ),
                          ),
                        ),
                        // backward
                        new GestureDetector(
                          onTapDown: (_) => _holdB(1),
                          onTapUp: (_) => _releaseB(1),
                          onTapCancel: () => _releaseB(1),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: colors[1],
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, left: 30.0),
                            width: 100.0,
                            height: 150.0,
                            child: new Center(
                              child: new Icon(IconData(0xe5db, fontFamily: 'MaterialIcons')),
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // left
                        new GestureDetector(
                          onTapDown: (_) => _holdB(2),
                          onTapUp: (_) => _releaseB(2),
                          onTapCancel: () => _releaseB(2),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: colors[2],
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                            width: 100.0,
                            height: 100.0,
                            child: new Center(
                              child: new Icon(IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                            ),
                          ),
                        ),
                        // right
                        new GestureDetector(
                          onTapDown: (_) => _holdB(3),
                          onTapUp: (_) => _releaseB(3),
                          onTapCancel: () => _releaseB(3),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: colors[3],
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                            margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
                            width: 100.0,
                            height: 100.0,
                            child: new Center(
                              child: new Icon(IconData(0xe5c8, fontFamily: 'MaterialIcons', matchTextDirection: true)),
                            ),
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
