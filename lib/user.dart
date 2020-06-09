

import 'package:deneme/post-user.dart';
import 'package:deneme/user-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget{
  //User({@required this.onPressed});
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
      ),
    body: Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            color: Colors.black,
            textColor: Colors.blue,
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserList()));
              },
            child: Text("Users List"),
          ),
          new RaisedButton(
            color: Colors.black,
            textColor: Colors.blue,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostUser()));
            },
            child: Text("Add New User"),
          ),
        ],
      )
    ),
    );
  }
}