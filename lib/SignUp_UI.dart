import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {

  @override
  SignUpState createState() => new SignUpState();
}


class SignUpState extends State<SignUp> {

  String email = "";
  String newUsername = "";
  String newPassword = "";
  String passwordFieldContent;

  // helper method that makes a get request to add user account
  inputData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/signup?username=${newUsername}&password=${newPassword}&email=${email}');
    String result = response.body;
    int id = int.parse(result);
    if (id < 0) {
      // Return "Existing account already associated with email."};
    }
    else if (id == 0) {
      // Return "Username already exists."
    }
    else {
      Navigator.of(context).pushNamed("/ProfileInfo");
    }
  }

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
                      inputData();
                    },
                  ),

                  new Text("Sign Up"),

                ]
            )
        )
    );
  }
}
