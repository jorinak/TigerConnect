import 'package:flutter/material.dart';

class FindConnections extends StatefulWidget {
  @override
  _FindConnectionsState createState() => new _FindConnectionsState();
}

class _FindConnectionsState extends State<FindConnections> {
  @override
  Widget build(BuildContext context) {

    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Text("Your don't have any connections yet"),

            new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/HomeProfilePage");},
            child: new Text("Connect"),
            )
          ],
        ),
      ),
    );
  }
}
