import 'package:flutter/material.dart';
import 'package:tiger_connect/HomeBody.dart';
import 'package:tiger_connect/AccountHome.dart';
import 'package:tiger_connect/CheckBoxes.dart';
import 'package:tiger_connect/BasicInfo.dart';
import 'package:tiger_connect/SignIn.dart';
import 'package:tiger_connect/SignUp.dart';


void main() {

  // command to make and run a new app
  runApp(
      new MaterialApp(

    // app contains a home page
      home: new HomePage(),

      // routes: different pages/screens we will be navigating to
        routes: <String, WidgetBuilder> {
        //FriendsPage.routeName : (BuildContext context) => new FriendsPage(),

          "/FriendsPage": (BuildContext context) => new FriendsPage(),
          "/SignInPage": (BuildContext context) => new SignInPage(),
          "/SignUpPage": (BuildContext context) => new SignUpPage(),
          "/HomeProfilePage": (BuildContext context) => new HomeProfilePage(),
          "/HomePage": (BuildContext context) => new HomePage(),
          "/SearchPage": (BuildContext context) => new SearchPage(),
          "/ProfileInfo": (BuildContext context) => new ProfileInfo(),
        }
      )
  );
}




// creates the home page with "sign in/up" icons
class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}



class HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    // the scaffold classes are used to design the page
    return new Scaffold(
        backgroundColor: Colors.white,

        // what will be seen at the top of the screen
        appBar: new AppBar(
          title: new Text("TigerConnect",
              style: new TextStyle(
                  color: Colors.orange)
          ),
          backgroundColor: Colors.black,
        ),

        // the rest of the page
        body: new HomeBody()
    );
  }
}


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign In",
          style: new TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.black,
      ),
      body: new SignIn(),
    );
  }
}


/*

// creates the sign in page (where username and password are inputted)
class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      // what will appear at the top of the screen
        appBar: new AppBar(
          title: new Text("Sign In",
            style: new TextStyle(color: Colors.orange),
          ),
          backgroundColor: Colors.black,),

        body: new SignIn()
    );
  }
}

*/


// creates the sign up page
class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sign Up",
            style: new TextStyle(color: Colors.orange),
          ),
          backgroundColor: Colors.black,),

        body: new SignUp()
    );
  }
}

// creates home profile page
class HomeProfilePage extends StatefulWidget {

  @override
  HomeProfilePageState createState() => new HomeProfilePageState();
}

class HomeProfilePageState extends State<HomeProfilePage> {

  @override
  Widget build(BuildContext context) {

    // the icon that appears at the top of the drawer screen
    Padding padding = new Padding(
        child: new Icon(
          Icons.account_box, size: 100.0, color: Colors.black,),
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
        leading: const Icon(Icons.contacts),
        onTap: _onPressed,
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
        title: new Text("TigerConnect",
          style: new TextStyle(
              color: Colors.orange),
        ),
          backgroundColor: Colors.black,
          actions: <Widget>[

          // the search icon at the top right of the screen
          new IconButton(
            icon: new Icon(Icons.search),

              // redirects to a page where the user can search for new "connects"
              onPressed: () { Navigator.of(context).pushNamed("/SearchPage");
            },
          ),
        ],
      ),

      // place holder
      body: new AccountHome()
    );
  }

  void _onPressed() {

    // ignore: argument_type_not_assignable
    //Navigator.popAndPushNamed(context, FriendsPage.routeName);
  }
}

// under construction, but its supposed to be the page
// with the list of the users friends
class FriendsPage extends StatefulWidget {

  @override
  FriendsPageState createState() => new FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {

  static String routeName = "sandyShores";

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
class SearchPage extends StatefulWidget {

  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

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
    var child2 = new Text("<category>",
      style: new TextStyle(fontSize: 18.0,
          fontFamily: "Arial",
      ),
    );

    // meant to be a category
    var child3 = new Text("<category>",
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
            new CheckBoxes(),

            padding2,

            // another row of boxes
            new CheckBoxes(),

            padding3,

            // another row of boxes
            new CheckBoxes(),

            padding3,

            // another row of boxes
            new CheckBoxes(),

            padding3,

            // another row of boxes
            new CheckBoxes(),

            padding3,

            // another row of boxes
            new CheckBoxes(),

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

class ProfileInfo extends StatefulWidget {

  @override
  ProfileInfoState createState() => new ProfileInfoState();
}

class ProfileInfoState extends State<ProfileInfo> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Basic Information",
          style: new TextStyle(
              color: Colors.orangeAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: new BasicInfo(),
    );
  }
}