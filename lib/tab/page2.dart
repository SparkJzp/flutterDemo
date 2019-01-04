import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  @override
  _TwoPageState createState() => new _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Text(
            'two',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
