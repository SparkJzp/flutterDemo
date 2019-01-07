import 'package:flutter/material.dart';
import 'dart:async';

class ChartDemo01Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChartDemo01State();
}

class ChartDemo01State extends State<ChartDemo01Page> {
  Stopwatch watch = new Stopwatch();
  Timer timer;
  String elapsedTime = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("StopWatch"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Text(
              elapsedTime,
              style: new TextStyle(fontSize: 25.0),
            ),
            SizedBox(
              width: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.play_arrow),
                  onPressed: startWatch,
                ),
                SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.stop),
                  onPressed: stopWatch,
                ),
                SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.refresh),
                  onPressed: resetWatch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 100), updateTIme);
  }

  updateTIme(Timer timer) {
    setState(() {
      elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
    });
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  resetWatch() {
    watch.reset();
    setTime();
    startWatch();
  }

  setTime() {
    var timeSofar = watch.elapsedMicroseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSofar);
    });
  }

  transformMilliSeconds(int time) {
    var hundreds = (time / 10).truncate();
    var seconds = (hundreds / 100).truncate();
    var minutes = (seconds / 60).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}
