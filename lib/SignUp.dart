import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;

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

    var paddingEmail = new Padding(
      padding: const EdgeInsets.only(right: 70.0, left: 70.0),
      child: new TextField(
        decoration: new InputDecoration(
          hintText: "Princeton Email",
          labelText: "Princeton Email",),
        onChanged: (String _email) {
          setState(() {
            email = _email;
          });
        },
      ),
    );

    var paddingUsr = new Padding(
      padding: const EdgeInsets.only(right: 70.0, left: 70.0),
      child: new TextField(
        decoration: new InputDecoration(
            hintText: "Create Your Username",
            labelText: "Create Your Username"),
        onChanged: (String _newUSr) {
          setState(() {
            newUsername = _newUSr;
          });
        },
      ),
    );

    var paddingPass = new Padding(
      padding: const EdgeInsets.only(right: 70.0, left: 70.0),
      child: new TextField(
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
    );

    return new Container(
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              paddingEmail,

              paddingUsr,

              paddingPass,

              new IconButton(
                icon: new Icon(
                    Icons.blur_circular,
                    color: Colors.orange),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.of(context).pushNamed("/ProfileInfo");},
              ),

              new Text("Sign Up", textAlign: TextAlign.center,),

            ],
          )
      ),
    );
  }
}