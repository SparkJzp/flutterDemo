import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => new _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Text(
            'three',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
