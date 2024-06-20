import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class vievdata extends StatefulWidget {
  @override
  _vievdataState createState() => _vievdataState();
}

class _vievdataState extends State<vievdata> {
  List users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    final response =
        await http.get(Uri.parse('https://ivnovav.ru/viev_data.php'));
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]['username']),
              subtitle: Text(users[index]['email']),
            );
          },
        ),
      ),
    );
  }
}
