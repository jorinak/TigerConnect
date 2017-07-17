import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => new SignInState();
}

class SignInState extends State<SignIn> {

  String passwordFieldContent;
  String password = "";
  String username = "";

  // helper method that makes a get request to verify user account
  checkData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/signin?username=${username}&password=${password}');
    String result = response.body;
    if (result == 'true\n') {
      Navigator.of(context).pushNamed("/HomeProfilePage");
    } else {
      // Display the text "Invalid credentials".
    }
  }

  @override
  Widget build(BuildContext context) {
    var _iconButton = new Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: new IconButton(
        icon: new Icon(Icons.blur_circular, color: Colors.orange),
        iconSize: 60.0,
        onPressed: () {
          checkData();
        },
      ),
    );

    return new Container(
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          // input fields provided (username and password)
          new TextField(
              decoration: new InputDecoration(
                  // before the text field is clicked by the user
                  // this text will appear there
                  hintText: "Username",

                  // when the user is typing their username this will
                  // hover over the text field as a reminder of what they
                  // should be typing
                  labelText: "Username"),
              onChanged: (String inputUsr) {
                setState(() {
                  username = inputUsr;
                });
              }),

          new TextField(
            decoration: new InputDecoration(
                hintText: "Password", labelText: "Password"),

            // replaces the text with dots
            obscureText: true,
            onChanged: (String inputPass) {
              password = inputPass;

              passwordFieldContent = inputPass;
            },
          ),

          // once username and password are inputted, click to redirect
          // to the users home page
          _iconButton,

          new Text(
            "Sign In",
            style: new TextStyle(fontSize: 16.0),
          ),
        ])));
  }
}
