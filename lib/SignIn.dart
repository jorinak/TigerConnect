import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;


class SignIn extends StatefulWidget {


  @override
  SignInState createState() => new SignInState();
}

class SignInState extends State<SignIn> {

  String passwordFieldContent;

  String password = "";

  String username = "";


  makeConnections() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get('http://localhost:8080/tiger-connect/connect?id=16');
    String reply = response.body;

    List<String> entries = reply.split(",");
    globals.u1_firstname = entries[2];
    globals.u2_firstname = entries[15];
    globals.u3_firstname = entries[28];
    globals.u4_firstname = entries[41];
    globals.u5_firstname = entries[54];

    print(globals.u5_firstname);

    globals.u1_lastname = entries[3];
    globals.u2_lastname = entries[16];
    globals.u3_lastname = entries[29];
    globals.u4_lastname = entries[42];
    globals.u5_lastname = entries[55];

    globals.u1_classyear = entries[4];
    globals.u2_classyear = entries[17];
    globals.u3_classyear = entries[30];
    globals.u4_classyear = entries[43];
    globals.u5_classyear = entries[56];

    globals.u1_description = entries[5];
    globals.u2_description = entries[18];
    globals.u3_description = entries[31];
    globals.u4_description = entries[44];
    globals.u5_description = entries[57];

    globals.u1_major = entries[6];
    globals.u2_major = entries[19];
    globals.u3_major = entries[32];
    globals.u4_major = entries[45];
    globals.u5_major = entries[58];

    globals.u1_rescollege = entries[7];
    globals.u2_rescollege = entries[20];
    globals.u3_rescollege = entries[33];
    globals.u4_rescollege = entries[46];
    globals.u5_rescollege = entries[59];

    globals.u1_interests = entries[8] + ", " + entries[9] + ", " + entries[10] + ", " + entries[11] + ", " + entries[12] + ".";
    globals.u2_interests = entries[21] + ", " + entries[22] + ", " + entries[23] + ", " + entries[24] + ", " + entries[25] + ".";
    globals.u3_interests = entries[34] + ", " + entries[35] + ", " + entries[36] + ", " + entries[37] + ", " + entries[38] + ".";
    globals.u4_interests = entries[47] + ", " + entries[48] + ", " + entries[49] + ", " + entries[50] + ", " + entries[51] + ".";
    globals.u5_interests = entries[60] + ", " + entries[61] + ", " + entries[62] + ", " + entries[63] + ", " + entries[64] + ".";

    Navigator.of(context).pushNamed("/HomeProfilePage");
  }

  // helper method that makes a get request to verify user account
  checkData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/signin?username=${username}&password=${password}');
    String reply = response.body;
    if (reply == 'false\n') {
      // Display the text "Invalid credentials".
    } else {
      globals.user_id = int.parse(reply);
      print(globals.user_id);
    }
  }

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
          checkData();
          Navigator.of(context).pushNamed("/CreateConnect");},
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
