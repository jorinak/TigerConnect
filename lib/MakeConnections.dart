import 'package:flutter/material.dart';

class ConnectButton extends StatefulWidget {
  @override
  _ConnectButtonState createState() => new _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You dont have any connections yet"),

            new Divider(color: Colors.white,),

            new RaisedButton(
              child: new Text("Make" + "\n" + "Connections",
                style: new TextStyle(color: Colors.orangeAccent,),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed("/HomeProfilePage");},),
          ],
        ),
      ),
    );
  }
}
