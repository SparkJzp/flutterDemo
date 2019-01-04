import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

class HttpDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  List datas;
  String url = 'https://randomuser.me/api/';

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: new Text('Click'),
        onPressed: makeRequest,
      ),
    );
  }

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "applocation/json"});
    print('response:$response.body');
    var data = json.jsonDecode(response.body);
    datas = data["results"];
    print('data:$data');
    print(datas[0]["name"]);
    return data[0]["location"];
  }
}
