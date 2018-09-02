import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';

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
  String useThis;
  String forward = "false";
  String backward = "false";
  String left = "false";
  String right = "false";

  Color _cforward = Color(0xFF00818a);
  Color _cbackward = Color(0xFF00818a);
  Color _cleft = Color(0xFF00818a);
  Color _cright = Color(0xFF00818a);

  _holdB(String id){
    setState(() {
      if(id == "forward"){
        _cforward = Color(0xFF404b69);
        forward = "true";
      }
      if(id == "backward"){
        _cbackward = Color(0xFF404b69);
        backward = "true";
      }
      if(id == "left"){
        _cleft = Color(0xFF404b69);
        left = "true";
      }
      if(id == "right"){
        _cright = Color(0xFF404b69);
        right = "true";
      }   
    });
  }

  _releaseB(String id){
    setState(() {
      if(id == "forward"){
        _cforward = Color(0xFF00818a);
        forward = "false";
      }
      if(id == "backward"){
        _cbackward = Color(0xFF00818a);
        backward = "false";
      }
      if(id == "left"){
        _cleft = Color(0xFF00818a);
        left = "false";
      }
      if(id == "right"){
        _cright = Color(0xFF00818a);
        right = "false";
      }
    });
  }

  _connectSocket() {
    socketIO = new SocketIO("http://192.168.1.216:8080", "/");
    socketIO.init();
    socketIO.connect();
  }
  _sendMsg(){
    String moveFlutter = '{forward:'+forward.toString()+',backward:'+backward.toString()+',left:'+left.toString()+',right:'+right.toString()+'}';
    socketIO.sendMessage("event", moveFlutter);
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
                onTapDown: (_) => _holdB('backward'),
                onTapUp: (_) => _releaseB('backward'),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: _cbackward,
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
                child: new Container(
                  decoration: new BoxDecoration(
                    color: _cforward,
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
                child: new Container(
                  decoration: new BoxDecoration(
                    color: _cleft,
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
                child: new Container(
                  decoration: new BoxDecoration(
                    color: _cright,
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
