import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';




class MapDemoPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new MapDemoState();
}

class MapDemoState extends State<MapDemoPage>{

  MapController _controller=new MapController();

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(
            "Map Demo",style: new TextStyle(
              fontSize: 20.0
            )
          ),
        ),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(89.30 , -26.8),
            minZoom: 10.0,
          ),
          
          layers: [
            new TileLayerOptions(
              urlTemplate: "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a','b','c'],
            ),
            new MarkerLayerOptions(
              markers: [new Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(89.30, -26.8),
                builder: (context) =>new Container(
                  child: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.location_on),
                    iconSize: 45.0,
                    onPressed: (){
                      print("marker tapped");
                    },
                  ),
                ),
              )],
            ),
          ],
        ),
      );
    }
}