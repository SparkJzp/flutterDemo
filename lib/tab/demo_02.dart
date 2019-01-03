import 'package:flutter/material.dart';
import './page1.dart' as page1;
import './page2.dart' as page2;
import './page3.dart' as page3;
class Demo_02Page extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new Demo_02PageState();
}
class Demo_02PageState extends State<Demo_02Page> with SingleTickerProviderStateMixin{
  
  TabController _tabController;
  @override
    void initState() {
      super.initState();
      _tabController=new TabController(vsync: this,length: 3);
    }
    @override
      void dispose() {
        _tabController.dispose();
        super.dispose();
      }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
            title: new Text('demo02_tab'),
            backgroundColor: Colors.teal,
            bottom: new TabBar(
              controller: _tabController,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.home)),
                new Tab(icon: new Icon(Icons.share)),
                new Tab(icon: new Icon(Icons.settings)),
              ],
            ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new page1.OnePage(),
            new page2.TwoPage(),
            new page3.ThreePage(),
          ],
        ),
      );
    }
}