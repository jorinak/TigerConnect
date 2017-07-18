import 'package:flutter/material.dart';


class AccountHome extends StatefulWidget {

  @override
  AccountHomeState createState() => new AccountHomeState();
}

class AccountHomeState extends State<AccountHome> {


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              new Icon(Icons.search, size: 200.0, color: Colors.grey,),

              new Text(
                "You don't have any connections yet. Start your rearch",
                style: new TextStyle(fontSize: 12.0,),
                textAlign: TextAlign.center,),
            ]
        ),
      ),
    );
  }
}
