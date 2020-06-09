import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final myController = TextEditingController();
class PostUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post User"),

      ),
      body: getUsers(),
  );
}
}

class getUsers extends StatefulWidget{
  getUsers({Key key}) : super(key: key);

  @override
  _getUsers createState() => _getUsers();
}

class _getUsers extends State<getUsers>{
  final _formKey = GlobalKey<FormState>();
  User newUser = new User("","","","");

  final String apiUrl = "http://10.0.2.2:59408/api/user";

  Future<http.Response> postUsers(String Name, String Address, String Contact, String imgLink) async {

   return http.post(apiUrl,
                    headers: <String, String>{
                      'Content-Type':'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String,String>{
                    'Name':Name,
                      'Address':Address,
                      'Contact':Contact,
                      'imgLink':imgLink,
       }),


   );


  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter User's Name",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              else{
                newUser.Name = value;
                print(value);
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter User's Address",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              else{
                newUser.Address = value;
                print(value);
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter User's Contact",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else{
                newUser.Contact = value;
                print(value);
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter image link for the user",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else{
                newUser.imgLink = value;
                print(value);
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                  var response = postUsers(newUser.Name, newUser.Address, newUser.Contact, newUser.imgLink);
                  print("Response = " + response.toString());
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class User{
  String Name,Address,Contact,imgLink;

  User(String Name, String Address, String Contact, String imgLink){
    this.Name = Name;
    this.Address = Address;
    this.Contact = Contact;
    this.imgLink = imgLink;
  }
}