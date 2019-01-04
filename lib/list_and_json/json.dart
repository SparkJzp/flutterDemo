import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

class JsonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new JsonDemoSate();
}

class JsonDemoSate extends State<JsonDemo> {
  List datas;
  String url = 'https://randomuser.me/api/?results=30';
  @override
  void initState() {
    this.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contact list'),
      ),
      body: new ListView.builder(
        itemCount: datas == null ? 0 : datas.length,
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
            title: new Text(datas[i]["name"]["first"]),
            subtitle: new Text(datas[i]["phone"]),
            leading: new CircleAvatar(
              backgroundImage:
                  new NetworkImage(datas[i]["picture"]["thumbnail"]),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new PicturePage(data: datas[i])));
            },
          );
        },
      ),
    );
  }

  Future<String> getInfo() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var jsonData = json.jsonDecode(response.body);
      datas = jsonData["results"];
    });
  }
}

class PicturePage extends StatelessWidget {
  final data;
  PicturePage({this.data});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pic Page"),
      ),
      body: new Center(
        child: new Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: const Color(0xf7ff7628),
            image: new DecorationImage(
              image: new NetworkImage(data["picture"]["large"]),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
            border: new Border.all(
              color: Colors.red,
              width: 4.0,
            ),
          ),
        ),
      ),
    );
  }
}
