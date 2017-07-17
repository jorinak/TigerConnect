import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicInfo extends StatefulWidget {

  @override
  BasicInfoState createState() => new BasicInfoState();
}

class BasicInfoState extends State<BasicInfo> {

  int userId        = 1;
  String firstName  = "";
  String lastName   = "";
  String classYear  = "";
  String resCollege = "";
  String major      = "";
  String shortDescription = "";

  // helper method that makes a get request to add user preferences
  inputData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/signup?id=${userId}'
            '&fname=${firstName}&lname=${lastName}&cyear=${classYear}'
            '&blurb=${shortDescription}&major=${major}&rcollege=${resCollege}');
    String id = response.body;
    Navigator.of(context).pushNamed("/Personality");
  }

  @override
  Widget build(BuildContext context) {

    var raisedButton = new Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 80.0, left: 80.0),

        child: new RaisedButton(
          child: new Text("Next",
            style: new TextStyle(
                color: Colors.orangeAccent,
                fontSize: 18.0),
          ),
          color: Colors.black,
          onPressed: () {
            inputData();
            },
        )
    );


    return new ListView(

      padding: const EdgeInsets.only(
        right: 70.0, top: 10.0, left: 30.0,
      ),

      children: <Widget>[

        new TextField(
          decoration: new InputDecoration(
              hintText: "First Name",
              labelText: "First Name"
          ),

          onChanged: (String _first) {
            setState(() {
              firstName = _first;
            });
          },
        ),

        new TextField(
          decoration: new InputDecoration(
            hintText: "Last Name",
            labelText: "Last Name",
          ),

          onChanged: (String _last) {
            setState(() {
              lastName = _last;
            });
          },
        ),

        new TextField(
          decoration: new InputDecoration(
            hintText: "Class Year",
            labelText: "Class Year",
          ),

          onChanged: (String _year) {
            setState(() {
              classYear = _year;
            });
          },
        ),

        new TextField(
          decoration: new InputDecoration(
              hintText: "Res. College",
              labelText: "Res. College"
          ),

          onChanged: (String _college) {
            setState(() {
              resCollege = _college;
            });
          },
        ),

        new TextField(
          decoration: new InputDecoration(
              hintText: "Major",
              labelText: "Major"
          ),

          onChanged: (String _major) {
            setState(() {
              major = _major;
            });
          },
        ),

        new TextField(
          decoration: new InputDecoration(
            hintText: "Short description",
          ),

          onChanged: (String _description) {
            setState(() {
              shortDescription = _description;
            });
          },

          maxLines: 4,
        ),

        raisedButton,
      ],
    );
  }
}
