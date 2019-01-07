import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class ChartDemo02Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChartDemo02State();
}

class ChartDemo02State extends State<ChartDemo02Page> {
  Stopwatch watch = new Stopwatch();
  Timer timer;
  String elapsedTime = "";

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = new Size(250.0, 250.0);
  Color labColor = Colors.blue;
  _generateChartData(int min, int second) {
    double temp = second * 0.6;
    double adjustedSeconds = second + temp;
    double tempMin = min * 0.6;
    double adjustedMin = tempMin + min;
    Color dialogColor = Colors.blue;
    Color labColor = dialogColor;
    List<CircularStackEntry> data = [
      new CircularStackEntry(
          [new CircularSegmentEntry(adjustedSeconds, labColor)])
    ];
    if (min > 0) {
      labColor = Colors.green;
      data.removeAt(0);
      data.add(new CircularStackEntry(
          [new CircularSegmentEntry(adjustedSeconds, labColor)]));
      data.add(new CircularStackEntry(
          [new CircularSegmentEntry(adjustedMin, Colors.green)]));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle =
        Theme.of(context).textTheme.title.merge(new TextStyle(color: labColor));
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("StopWatch"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new AnimatedCircularChart(
                key: _chartKey,
                size: _chartSize,
                initialChartData: _generateChartData(0, 0),
                chartType: CircularChartType.Radial,
                edgeStyle: SegmentEdgeStyle.round,
                percentageValues: true,
                holeLabel: elapsedTime,
                labelStyle: _textStyle,
              ),
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
    if (watch.isRunning) {
      var milliseconds = watch.elapsedMilliseconds;
      var hundreds = (milliseconds / 10).truncate();
      var seconds = (hundreds / 100).truncate();
      var minutes = (seconds / 60).truncate();
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
        if(seconds>59){
          seconds=seconds-(59*minutes);
          seconds=seconds-minutes;
        }
        List<CircularStackEntry> data = _generateChartData(minutes, seconds);
        _chartKey.currentState.updateData(data);
      });
    }
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
      List<CircularStackEntry> data = _generateChartData(0, 0);
      _chartKey.currentState.updateData(data);
    });
  }

  transformMilliSeconds(int time) {
    var hundreds = (time / 10).truncate();
    var seconds = (hundreds / 100).truncate();
    var minutes = (seconds / 60).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
}
