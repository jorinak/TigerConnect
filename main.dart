import 'package:flutter/material.dart';

void main() {


  // command to make and run a new app
  runApp(new MaterialApp(

    // app contains a home page
      home: new HomePage(),

      // routes: different pages/screens we will be navigating to
      routes: <String, WidgetBuilder> {
        "/SignInPage": (BuildContext context) => new SignInPage(),
        "/SignUpPage": (BuildContext context) => new SignUpPage(),
        "/HomeProfilePage": (BuildContext context) => new HomeProfilePage(),
        "/HomePage": (BuildContext context) => new HomePage(),
        "/SearchPage": (BuildContext context) => new SearchPage(),
      }
  ));
}

// creates the home page with "sign in/up" icons
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // the scaffold classes are used to design the page
    return new Scaffold(
        backgroundColor: Colors.white,

        // what will be seen at the top of the screen
        appBar: new AppBar(
          title: new Text("TigerConnect", style: new TextStyle(color: Colors.orange)),
          backgroundColor: Colors.black,
        ),

        // the rest of the page
        body: new Container(
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
                )
            )
        )
    );
  }
}

// creates the sign in page (where username and password are inputted)
class SignInPage extends StatelessWidget {
  String passwordFieldContent;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      // what will appear at the top of the screen
        appBar: new AppBar(
          title: new Text("Sign In", style: new TextStyle(color: Colors.orange),),
          backgroundColor: Colors.black,),
        body: new Container(
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
                              labelText: "Username"
                          )
                      ),

                      new TextField(
                          decoration: new InputDecoration(
                            hintText: "Password",
                            labelText: "Password"
                          ),

                          // replaces the text with dots
                          obscureText: true,
                        onChanged: (String value) {
                            passwordFieldContent = value;
                        },
                      ),

                      // once username and password are inputted, click to redirect
                      // to the users home page
                      new IconButton(
                        icon: new Icon(
                            Icons.blur_circular, color: Colors.orange),
                        iconSize: 60.0,
                        onPressed: () {Navigator.of(context).pushNamed("/HomeProfilePage");},
                      ),
                      new Text("Sign In")
                    ]
                )
            )
        )
    );
  }
}

// creates the sign up page
class SignUpPage extends StatelessWidget {
  String passwordFieldContent;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sign Up", style: new TextStyle(color: Colors.orange),),
          backgroundColor: Colors.black,),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      // sign up requirements
                      new TextField(
                          decoration: new InputDecoration(
                              hintText: "Princeton Email",
                            labelText: "Princeton Email"
                          )
                      ),

                      new TextField(
                          decoration: new InputDecoration(
                              hintText: "Create Your Username",
                            labelText: "Create Your Username"
                          )
                      ),

                      new TextField(
                          decoration: new InputDecoration(
                              hintText: "Create Your Password",
                            labelText: "Create Your Password",
                          ),

                      // hides the text of the password being inputted
                      obscureText: true,
                        onChanged: (String value) {
                            passwordFieldContent = value;
                        },
                      ),

                      // button to be clicked once all requirements have been
                      // inputted
                      new IconButton(
                        icon: new Icon(
                            Icons.account_circle, color: Colors.tealAccent),
                        iconSize: 70.0,

                        // the button does not push to another page yet
                        onPressed: null,
                      ),
                      new Text("Sign Up")
                    ]
                )
            )
        )
    );
  }
}

// creates home profile page
class HomeProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // the icon that appears at the top of the drawer screen
    Padding padding = new Padding(
        child: new Icon(
          Icons.account_circle, size: 100.0, color: Colors.black,),
          padding: const EdgeInsets.only(bottom: 20.0)
    );

    var drawerHeader = new DrawerHeader(
        child: new IconButton(
            icon: padding, onPressed: null)
    );

    // the ListView children
    var children = <Widget>[

      drawerHeader,

      // ListTiles will allow the user to access their, for example,
      // friend list, page to edit their profile, settings etc.
      // CURRENTLY STUCK ON THIS!!!!!
      new ListTile(
        title: const Text("Friends"),
        enabled: true,
        leading: const Icon(Icons.people),
      ),

      new ListTile(
        title: const Text("<blank>"),
        enabled: true
      ),
    ];

    // the drawers child: a ListView which can have
    // more than one child
    var child1 = new ListView(children: children);

    // creates a drawer: on the top left side of the screen
    // only takes one child (i can only add 1 widget to it)
    Drawer drawer = new Drawer(child: child1);

    return new Scaffold(drawer: drawer,

      appBar: new AppBar(
        title: new Text("TigerConnect", style: new TextStyle(color:
        Colors.orange),),
        backgroundColor: Colors.black,
        actions: <Widget>[

          // the search icon at the top right of the screen
          new IconButton(
            icon: new Icon(Icons.search),

              // redirects to a page where the user can search for new "connects"
              onPressed: () {
              Navigator.of(context).pushNamed("/SearchPage");
            },
          ),
        ],
      ),

      // place holder
      body: new Container(
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
      ),
    );
  }
}

// under construction, but its supposed to be the page
// with the list of the users friends
class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Friends"),
        backgroundColor: Colors.black,
      ),
    );
  }
}

// where the user is redirected to when they click the search buttom
class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var child1 = new Text("Choose from the following categories (choose at least 1)",
      textAlign: TextAlign.center,
        style: new TextStyle(fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Times New Roman",
      ),
    );

    // meant to be a category
    var child2 = new Text("TBD",
      style: new TextStyle(fontSize: 18.0,
          fontFamily: "Arial",
      ),
    );

    // meant to be a category
    var child3 = new Text("TBD",
      style: new TextStyle(fontSize: 18.0,
        fontFamily: "Arial",
      ),
    );

    // paddings for the texts
    var pad = const EdgeInsets.only(top: 14.0, bottom: 15.0);

    var pad2 = const EdgeInsets.only(top: 14.0, left: 5.0);

    // paddings for the little boxes
    var padding = new Padding(child: child1 ,padding: pad);

    var padding2 = new Padding(child: child2, padding: pad2);

    var padding3 = new Padding(child: child3, padding: pad2);


    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Make Connections",
          style: new TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.black,
      ),
      
      body: new Container(
        child: new ListView(

          children: <Widget>[

            padding,

            padding3,

            // row with 3 option boxes for the user to click on based on a category
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              new Container(
                  child: new Column(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: null,
                            child: new Icon(Icons.check_box_outline_blank,
                              color: Colors.black,)),

                        new Text("Similar")
                      ]
                  )
              ),
              
              new Container(
                child: new Column(
                  children: <Widget>[
                    new FlatButton(
                      onPressed: null,
                      child: new Icon(Icons.check_box_outline_blank,
                        color: Colors.black,)),
                 
                    new Text("Different")
                  ]
                )
              ),

              new Container(
                  child: new Column(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: null,
                            child: new Icon(Icons.check_box_outline_blank,
                              color: Colors.black,)),

                        new Text("None")
                      ]
                  )
                ),
              ]
            ),

            padding2,

            // another row of boxes
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[


                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Similar")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Different")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("None")
                          ]
                      )
                  ),
                ]
            ),

            padding3,

            // another row of boxes
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Similar")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Different")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("None")
                          ]
                      )
                  ),
                ]
            ),

            padding3,

            // another row of boxes
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Similar")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Different")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("None")
                          ]
                      )
                  ),
                ]
            ),

            padding3,

            // another row of boxes
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Similar")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Different")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("None")
                          ]
                      )
                  ),
                ]
            ),

            padding3,

            // another row of boxes
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Similar")
                          ]
                      )
                  ),



                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("Different")
                          ]
                      )
                  ),

                  new Container(
                      child: new Column(
                          children: <Widget>[
                            new FlatButton(
                                onPressed: null,
                                child: new Icon(Icons.check_box_outline_blank,
                                  color: Colors.black,)),

                            new Text("None")
                          ]
                      )
                  ),
                ]
            ),

            // once the user is done choosing, search button at the bottom
            new Container(alignment: FractionalOffset.bottomCenter,

                child: new FlatButton(
                    onPressed: null,
                    child: new Icon(Icons.search, size: 28.0,),
                    color: Colors.blue
                )
            )
          ]
        )
      )
    );
  }
}