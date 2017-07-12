import 'package:flutter/material.dart';


class CheckBoxes extends StatefulWidget {

  @override
  CheckBoxesState createState() => new CheckBoxesState();
}


class CheckBoxesState extends State<CheckBoxes> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        new Container(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                onPressed: null,
                child: new Icon(Icons.check_box_outline_blank),
                color: Colors.black,
              ),
              new Text("Similar")
            ],
          ),
        ),

        new Container(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                onPressed: null,
                child: new Icon(Icons.check_box_outline_blank),
                color: Colors.black,
              ),
              new Text("Different")
            ],
          ),
        ),

        new Container(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                onPressed: null,
                child: new Icon(Icons.check_box_outline_blank),
                color: Colors.black,
              ),
              new Text("None")
            ],
          ),
        )
      ],
    );
  }
}

