import 'package:flutter/material.dart';

class SavedChats extends StatefulWidget {
  @override
  _SavedChatsState createState() => new _SavedChatsState();
}

class _SavedChatsState extends State<SavedChats> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.all(15.0),
      children: <Widget>[
        
        new ListTile(
          title: new Text("<some friend>"),
          //trailing: new Icon(Icons.message, ),
          onTap: () {Navigator.of(context).pushNamed("/MessageFriend");},
        ),

        new Divider(),

        new ListTile(
          title: new Text("<some friend>"),
          onTap: () {Navigator.of(context).pushNamed("/MessageFriend");},
        ),

        new Divider()
      ],
    );
  }
}
