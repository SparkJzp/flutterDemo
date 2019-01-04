import 'dart:async';
import 'package:demo/slide_menu/about.dart';
import 'package:flutter/material.dart';

class SlideMenuPage extends StatefulWidget {
  @override
  _SlideMenuPage createState() => new _SlideMenuPage();
}

class _SlideMenuPage extends State<SlideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("slide menu"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("kaka"),
              accountEmail: new Text("sparkxxx@163.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage("http://i.pravatar.cc/300"),
              ),
            ),
            new ListTile(
              title: Text("about page"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AboutPage()));
              },
            ),
            new Divider(
              height: 1.0,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
