import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new InputDemoState();
}

class InputDemoState extends State<InputDemo> {
  final textCtrl = new TextEditingController();
  String textInput = '';
  bool enable = false;
  bool expland = false;
  bool checked = false;
  String radioValue;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('input demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration:
                  new InputDecoration(hintText: 'please input something'),
              onChanged: (String text) {
                setState(() {
                  textInput = textCtrl.text.length.toString();
                });
              },
              controller: textCtrl,
            ),
            new Text(textInput),
            new Switch(
              onChanged: (bool val) {
                setState(() {
                  enable = val;
                });
              },
              value: enable,
              activeColor: Colors.green,
              activeTrackColor: Colors.blueAccent[400],
            ),
            new ExpansionPanelList(
              expansionCallback: (i, bool val) {
                setState(() {
                  expland = !val;
                });
              },
              children: [
                new ExpansionPanel(
                  body: new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new Text('hello'),
                  ),
                  headerBuilder: (BuildContext context, bool val) {
                    return new Center(
                      child: new Text(
                        'tap on me',
                        style: new TextStyle(fontSize: 24.0),
                      ),
                    );
                  },
                  isExpanded: expland,
                ),
              ],
            ),
            new Checkbox(
              onChanged: (bool val) {
                setState(() {
                  checked = val;
                });
              },
              value: checked,
              activeColor: Colors.pink,
            ),
            new Row(
              children: <Widget>[
                new Radio(
                  onChanged: (String val){
                   setRadioValue(val);
                  },
                  activeColor: Colors.red,
                  value: 'first',
                  groupValue: radioValue,
                ),
                new Radio(
                  onChanged: (String val){
                   setRadioValue(val);
                  },
                  activeColor: Colors.green,
                  value: 'second',
                  groupValue: radioValue,
                ),
                new Radio(
                  onChanged: (String val){
                   setRadioValue(val);
                  },
                  activeColor: Colors.blue,
                  value: 'three',
                  groupValue: radioValue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  setRadioValue(String value){
    setState(() {
          radioValue=value;
          print(radioValue);
        });
  }
}
