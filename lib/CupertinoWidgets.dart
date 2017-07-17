import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class cupertinoSlider extends StatefulWidget {

  @override
  _cupertinoSliderState createState() => new _cupertinoSliderState();
}

class _cupertinoSliderState extends State<cupertinoSlider> {

  double sliderValue;

  double _dualCommandment = 0.0;

  @override
  Widget build(BuildContext context) {

    return new CupertinoSlider(
      value: _dualCommandment.toDouble(),
      onChanged: (double value) {
        setState(() {
          sliderValue = value;
          _dualCommandment = value;
        });
      },
      max: 5.0,
      min: 0.0,
      divisions: 5,
    );
  }
}


// numbers under sliders
class numberLine extends StatefulWidget {
  @override
  _numberLineState createState() => new _numberLineState();
}

class _numberLineState extends State<numberLine> {
  Widget padding = new Padding(
      padding: const EdgeInsets.only(bottom: 50.0),

      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
                  new Text("0", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  new Text("1", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  new Text("2", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  new Text("3", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  new Text("4", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  new Text("5", style: new TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
          ],
      ),
  );

  @override
  Widget build(BuildContext context) {
    return padding;
  }
}


