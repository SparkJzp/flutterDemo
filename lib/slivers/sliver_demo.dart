import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  @override
  _SliverPage createState() => new _SliverPage();
}

class _SliverPage extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("sliver"),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: new Text("Sliver Effect"),
            leading: new Icon(Icons.arrow_back),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.network("https://placeimg.com/720/480/320/any"),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) =>
              new Card(
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            new NetworkImage("http://i.pravatar.cc/300"),
                      ),
                      SizedBox(width: 10.0),
                      new Text("i am card content!!")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
