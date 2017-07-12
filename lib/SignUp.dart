import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  SignUpState createState() => new SignUpState();
}


class SignUpState extends State<SignUp> {


  String email = "";
  String newUsername = "";
  String newPassword = "";
  String passwordFieldContent;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: "Princeton Email",
                        labelText: "Princeton Email"),
                      onChanged: (String _email) {
                        setState(() {
                          email = _email;
                        });
                      },
                    ),

                  new TextField(
                      decoration: new InputDecoration(
                          hintText: "Create Your Username",
                          labelText: "Create Your Username"),
                      onChanged: (String _newUSr) {
                        setState(() {
                          newUsername = _newUSr;
                        });
                      },
                  ),

                  new TextField(
                      decoration: new InputDecoration(
                          hintText: "Create Your Password",
                          labelText: "Create Your Password",
                      ),

                      obscureText: true,

                      onChanged: (String _newPass) {
                        setState(() {
                          newPassword = _newPass;
                        });
                        passwordFieldContent = _newPass;
                        },
                  ),

                  new IconButton(
                      icon: new Icon(
                          Icons.blur_circular,
                          color: Colors.orange),
                      iconSize: 70.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ProfileInfo");
                        },
                  ),

                  new Text("Sign Up"),

                ]
            )
        )
    );
  }
}
