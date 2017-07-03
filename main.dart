import 'package:flutter/material.dart';

void main() {

  runApp(new MaterialApp(
      home: new HomePage(),
    )
  );
}

// creates the home page with "sign in/up" icons
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text("TigerConnect", style: new TextStyle(color: Colors.orange)),
          backgroundColor: Colors.black,
        ),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    // the icon and text widgets
                    children: <Widget>[

                      new IconButton(
                        icon: new Icon(
                            Icons.account_box, color: Colors.orange),
                        iconSize: 70.0,

                        onPressed: () {Navigator.of(context).pushNamed("/SignInPage");},
                      ),
                      new Container(
                        child: new Text("Sign In", style: new TextStyle(
                            letterSpacing: 1.0, fontSize: 18.0, color: Colors.black),),
                      ),
                      new IconButton(

                        icon: new Icon(

                          Icons.account_box, color: Colors.black,),
                        iconSize: 70.0,

                        // redirects to sign in page when sign in icon is clicked
                        onPressed: () {Navigator.of(context).pushNamed("/SignUpPage");},
                      ),


                      new Container(
                        child: new Text("Sign Up", style: new TextStyle(
                            letterSpacing: 1.0, fontSize: 18.0, color: Colors.black),),
                      ),
                    ]
                )
            )
        )
    );
  }
}