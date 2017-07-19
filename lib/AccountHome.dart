import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class AccountHome extends StatefulWidget {

  @override
  AccountHomeState createState() => new AccountHomeState();
}

class AccountHomeState extends State<AccountHome> {


  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0, bottom: 50.0),
        children: <Widget>[

                new SizedBox(
                  height: 300.0,
                  child: new Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: new Column(

                      children: <Widget>[
                        new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new AssetImage('images/tiger.jpg'),
                            backgroundColor: Colors.white,
                            radius: 600.0,
                          ),
                          title: new Text(globals.u1_firstname + globals.u1_lastname),
                          subtitle: new Text(globals.u1_rescollege + "\n" +
                              globals.u1_classyear + "\n" + globals.u1_major),

                          trailing: new Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: new Icon(Icons.person_add),
                                  onPressed: null),
                              new IconButton(
                                  icon: new Icon(Icons.message),
                                  onPressed: null)
                            ],
                          ),

                        ),
                        new Divider(),
                        new ListTile(
                          title: new Text(globals.u1_interests),
                        ),

                        new Divider(),
                        
                        new ListTile(
                          title: new Text(globals.u1_description),
                        )
                      ],
                    ),
                  ),
                ),

                new SizedBox(
                  height: 300.0,
                  child: new Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: new Column(

                      children: <Widget>[
                        new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new AssetImage('images/tiger.jpg'),
                            backgroundColor: Colors.white,
                            radius: 600.0,
                          ),
                          title: new Text(globals.u2_firstname + globals.u2_lastname),
                          subtitle: new Text(globals.u2_rescollege + "\n" +
                              globals.u2_classyear + "\n" + globals.u2_major),

                          trailing: new Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: new Icon(Icons.person_add),
                                  onPressed: null),
                              new IconButton(
                                  icon: new Icon(Icons.message),
                                  onPressed: null)
                            ],
                          ),

                        ),
                        new Divider(),
                        new ListTile(
                          title: new Text(globals.u2_interests),
                        ),

                        new Divider(),

                        new ListTile(
                          title: new Text(globals.u2_description),
                        )
                      ],
                    ),
                  ),
                ),

                new SizedBox(
                  height: 300.0,
                  child: new Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: new Column(

                      children: <Widget>[
                        new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new AssetImage('images/tiger.jpg'),
                            backgroundColor: Colors.white,
                            radius: 600.0,
                          ),
                          title: new Text(globals.u3_firstname + globals.u3_lastname),
                          subtitle: new Text(globals.u3_rescollege + "\n" +
                              globals.u3_classyear + "\n" + globals.u3_major),

                          trailing: new Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: new Icon(Icons.person_add),
                                  onPressed: null),
                              new IconButton(
                                  icon: new Icon(Icons.message),
                                  onPressed: null)
                            ],
                          ),

                        ),
                        new Divider(),
                        new ListTile(
                          title: new Text(globals.u3_interests),
                        ),

                        new Divider(),

                        new ListTile(
                          title: new Text(globals.u3_description),
                        )
                      ],
                    ),
                  ),
                ),

                new SizedBox(
                  height: 300.0,
                  child: new Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: new Column(

                      children: <Widget>[
                        new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new AssetImage('images/tiger.jpg'),
                            backgroundColor: Colors.white,
                            radius: 600.0,
                          ),
                          title: new Text(globals.u4_firstname + globals.u4_lastname),
                          subtitle: new Text(globals.u4_rescollege + "\n" +
                              globals.u4_classyear + "\n" + globals.u4_major),

                          trailing: new Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: new Icon(Icons.person_add),
                                  onPressed: null),
                              new IconButton(
                                  icon: new Icon(Icons.message),
                                  onPressed: null)
                            ],
                          ),

                        ),
                        new Divider(),
                        new ListTile(
                          title: new Text(globals.u4_interests),
                        ),

                        new Divider(),

                        new ListTile(
                          title: new Text(globals.u4_description),
                        )
                      ],
                    ),
                  ),
                ),

                new SizedBox(
                  height: 300.0,
                  child: new Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: new Column(

                      children: <Widget>[
                        new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new AssetImage('images/tiger.jpg'),
                            backgroundColor: Colors.white,
                            radius: 600.0,
                          ),
                          title: new Text(globals.u5_firstname + globals.u5_lastname),
                          subtitle: new Text(globals.u5_rescollege + "\n" +
                              globals.u5_classyear + "\n" + globals.u5_major),

                          trailing: new Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: new Icon(Icons.person_add),
                                  onPressed: null),
                              new IconButton(
                                  icon: new Icon(Icons.message),
                                  onPressed: null)
                            ],
                          ),

                        ),
                        new Divider(),
                        new ListTile(
                          title: new Text(globals.u5_interests),
                        ),

                        new Divider(),

                        new ListTile(
                          title: new Text(globals.u5_description),
                        )
                      ],
                    ),
                  ),
                ),

        ]
    );
  }
}
