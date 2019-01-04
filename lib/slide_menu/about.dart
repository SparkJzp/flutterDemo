import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPage createState() => new _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("about"),
      ),
      body: new Center(
        child: new Text("data"),
      ),
    );
  }
}
