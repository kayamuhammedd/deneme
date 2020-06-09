import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserList extends StatelessWidget{

  final String apiUrl = "http://192.168.1.21:59408/api/user/json";
  //final String apiUrl = "http://10.0.2.2:59408/api/user/json";
  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body);

  }

  String _name(dynamic user){
    print(user['Name']);
    return user['Name'] + " ";

  }

  String _address(dynamic user){
    return user['Address'];
  }

  String _contact(Map<dynamic, dynamic> user){
    return "Number: " + user['Contact'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(_contact(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(snapshot.data[index]['imgLink'])),
                              title: Text(_name(snapshot.data[index])),
                              subtitle: Text(_address(snapshot.data[index])),
                              trailing: Text(_contact(snapshot.data[index])),
                            )
                          ],
                        ),
                      );
                  });
            }else {
              print("HAS NO DATA");
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}