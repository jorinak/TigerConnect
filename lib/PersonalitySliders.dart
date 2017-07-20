import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tiger_connect/CupertinoWidgets.dart';

class PersonalitySliders extends StatefulWidget {
  @override
  _PersonalitySlidersState createState() => new _PersonalitySlidersState();
}

class _PersonalitySlidersState extends State<PersonalitySliders> {

  var openness;
  var conscientiousness;
  var extraversion;
  var agreeableness;
  var emotionalStability;

  double _openness = 0.0;
  double _conscientiousness = 0.0;
  double _extraversion = 0.0;
  double _agreeable = 0.0;
  double _stability = 0.0;
  
  // helper method that makes a get request to add personality preferences
  inputData() async {
    int o = _openness.toInt();
    int c = _conscientiousness.toInt();
    int e = _extraversion.toInt();
    int a = _agreeable.toInt();
    int n = _stability.toInt();
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/personality?id=${globals.user_id}&scale1=${o}&scale2=${c}&scale3=${e}&scale4=${a}&scale5=${n}');
    print(response.statusCode);
    print(response.body);
    Navigator.of(context).pushNamed("/Categories");
  }
  
  @override
  Widget build(BuildContext context) {

    var raisedButton = new Padding(
        padding: const EdgeInsets.only(right: 80.0, left: 80.0, bottom: 80.0),

        child: new RaisedButton(
          child: new Text("Next",
            style: new TextStyle(
                color: Colors.orangeAccent,
                fontSize: 18.0),
          ),
          color: Colors.black,
          onPressed: () {inputData();},
        )
    );

    return new ListView(

      padding: const EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
      children: <Widget>[

        new Text("Openness to Experience",
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold
          ),
        ),

        new CupertinoSlider(
            value: _openness.toDouble(),
            onChanged: (double value) {
              setState(() {
                openness = value;
                _openness = value;
              });
            },
            max: 5.0,
            min: 0.0,
            divisions: 5,
        ),

        new numberLine(),

        new Text("Conscientiousness",
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold
          ),
        ),

        new CupertinoSlider(
          value: _conscientiousness.toDouble(),
          onChanged: (double value) {
            setState(() {
              conscientiousness = value;
              _conscientiousness = value;
            });
          },
          max: 5.0,
          min: 0.0,
          divisions: 5,
        ),

        new numberLine(),

        new Text("Extraversion",
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold
          ),
        ),

        new CupertinoSlider(
          value: _extraversion.toDouble(),
          onChanged: (double value) {
            setState(() {
              extraversion = value;
              _extraversion = value;
            });
          },
          max: 5.0,
          min: 0.0,
          divisions: 5,
        ),

        new numberLine(),

        new Text("Agreeableness",
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold
          ),
        ),

        new CupertinoSlider(
          value: _agreeable.toDouble(),
          onChanged: (double value) {
            setState(() {
              agreeableness = value;
              _agreeable = value;
            });
          },
          max: 5.0,
          min: 0.0,
          divisions: 5,
        ),

        new numberLine(),

        new Text("Emotional Stability",
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold
          ),
        ),

        new CupertinoSlider(
          value: _stability.toDouble(),
          onChanged: (double value) {
            setState(() {
              emotionalStability = value;
              _stability = value;
            });
          },
          max: 5.0,
          min: 0.0,
          divisions: 5,
        ),

        new numberLine(),

        raisedButton,
      ],
    );
  }
}
