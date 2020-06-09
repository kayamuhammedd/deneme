import 'package:flutter/material.dart';
import 'package:deneme/user-list.dart';
import 'package:deneme/user.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      //home: UserList(),
      home: User(),
    );
  }
}