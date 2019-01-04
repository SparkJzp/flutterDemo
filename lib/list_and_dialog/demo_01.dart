import 'dart:async';
import 'package:flutter/material.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListViewDemoState();
}

class ListViewDemoState extends State<ListViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('listview demo'),
      ),
      body: new Container(
        child: new _ListView(),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (context, i) {
        return new ListTile(
          title: new Text('Some Radon name'),
          subtitle: new Text(
            'online',
            style: new TextStyle(
                fontStyle: FontStyle.italic, color: Colors.orangeAccent),
          ),
          leading: const Icon(Icons.face),
          trailing: new RaisedButton(
            child: new Text('Remove'),
            onPressed: () {
              deleteDialog(context).then((value) {
                print('value is $value');
              });
            },
          ),
        );
      },
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Are you sure?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
      barrierDismissible: false);
}
