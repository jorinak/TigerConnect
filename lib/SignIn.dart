import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {


  @override
  SignInState createState() => new SignInState();
}

class SignInState extends State<SignIn> {

  String passwordFieldContent;

  String password = "";

  String username = "";

  @override
  Widget build(BuildContext context) {

    var paddingUsr = new Padding(
        padding: const EdgeInsets.only(right: 70.0, left: 70.0),
        child: new TextField(
            decoration: new InputDecoration(

                hintText: "Username",

                labelText: "Username"
            ),

            onChanged: (String inputUsr) {
              setState(() {
                username = inputUsr;
              });
            }
        ),
    );

    var paddingPass = new Padding(
        padding: const EdgeInsets.only(right: 70.0, left: 70.0),
        child: new TextField(
          decoration: new InputDecoration(
              hintText: "Password",
              labelText: "Password"
          ),

          // replaces the text with dots
          obscureText: true,
          onChanged: (String inputPass) {
            password = inputPass;
            passwordFieldContent = inputPass;
          },
        ),
    );

    var _iconButton = new Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: new IconButton(
        icon: new Icon(
            Icons.blur_circular,
            color: Colors.orange
        ),
        iconSize: 60.0,
        onPressed: () {
          Navigator.of(context).pushNamed("/HomeProfilePage");
        },
      ),
    );

    return new Container(
      child: new Center(
        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            paddingUsr,

            paddingPass,

            // once username and password are inputted, click to redirect
            // to the users home page
            _iconButton,

            new Text("Sign In",
              style: new TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

