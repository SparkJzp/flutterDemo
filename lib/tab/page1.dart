import 'package:flutter/material.dart';
class OnePage extends StatefulWidget{
 @override
  _OnePageState createState() => new _OnePageState();
}
class _OnePageState extends State<OnePage>{
    @override
      Widget build(BuildContext context) {
        return new Scaffold(
          body: new Center(
            child: new Container(
              child: new Text('one',style: TextStyle(color: Colors.blueAccent),),
            ),
          ),
        );
      }
}