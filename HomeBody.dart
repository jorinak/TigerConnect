import 'package:flutter/material.dart';


class HomeBody extends StatefulWidget {

  @override
  HomeBodyState createState() => new HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,

            // the icon and text widgets
            children: <Widget>[

              // the "Sign In" button
              new IconButton(
                icon: new Icon(
                    Icons.account_box, color: Colors.orange),
                iconSize: 70.0,

                // navigates to the page where username and password
                // must be inputted once "Sign In" is clicked
                onPressed: () {Navigator.of(context).pushNamed("/SignInPage");},
              ),
              new Container(
                child: new Text("Sign In", style: new TextStyle(
                    letterSpacing: 1.0, fontSize: 18.0, color: Colors.black),),
              ),

              // the "Sign Up" button
              new IconButton(
                icon: new Icon(
                  Icons.account_box, color: Colors.black,),
                iconSize: 70.0,

                // navigates to the page where you make your account when
                // "Sign Up" button is clicked
                onPressed: () {Navigator.of(context).pushNamed("/SignUpPage");},
              ),

              new Container(
                child: new Text("Sign Up", style: new TextStyle(
                    letterSpacing: 1.0, fontSize: 18.0, color: Colors.black),),
              ),
            ]
        ),
      ),
    );
  }
}
