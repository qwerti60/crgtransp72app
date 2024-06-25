import 'package:flutter/material.dart';

//class creguser3_name extends StatefulWidget {

class creguser3_name extends StatelessWidget {
  final int rollNum;
  final int statNum;
  final String firstName;
  final String lastName;
  final String middleName;
  final String city;

  creguser3_name(
      {required this.rollNum,
      required this.statNum,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.city,
      required int rolNum});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Roll Number: $rollNum'),
            Text('Stat Number: $statNum'),
            Text('First Name: $firstName'),
            Text('Last Name: $lastName'),
            Text('Middle Name: $middleName'),
            Text('City: $city'),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
// Here, you would normally process the phone, email, and password information
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
