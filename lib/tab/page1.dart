import 'package:flutter/material.dart';
import './page2.dart' as page2;
import './page3.dart' as page3;

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => new _OnePageState();
}

class _OnePageState extends State<OnePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new page2.TwoPage(),
          new page3.ThreePage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.teal,
        child: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.share)),
          ],
        ),
      ),
    );
  }
}
