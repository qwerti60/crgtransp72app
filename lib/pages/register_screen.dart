import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State {
  final _formKey = GlobalKey();

// Создание контроллеров для полей ввода
  final TextEditingController rollNum = TextEditingController();
  final TextEditingController statNum = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController namefirm = TextEditingController();
  final TextEditingController innStr = TextEditingController();
  final TextEditingController ogrnStr = TextEditingController();
  final TextEditingController vidt = TextEditingController();
  final TextEditingController marka = TextEditingController();
  final TextEditingController godv = TextEditingController();
  final TextEditingController maxgruz = TextEditingController();
  final TextEditingController dkuzov = TextEditingController();
  final TextEditingController shkuzov = TextEditingController();
  final TextEditingController vidk = TextEditingController();
  final TextEditingController cenahaurs = TextEditingController();
  final TextEditingController cenasmena = TextEditingController();
  final TextEditingController cenakm = TextEditingController();

  Future registerUser() async {
    final response = await http.post(
      Uri.parse('http://ivnovav.ru/api/register1.php'),
      body: {
        'rollNum': rollNum.text,
        'statNum': statNum.text,
        'firstName': firstName.text,
        'middleName': middleName.text,
        'lastName': lastName.text,
        'city': city.text,
        'phone': phone.text,
        'email': email.text,
        'password': password.text,
        'namefirm': namefirm.text,
        'innStr': innStr.text,
        'ogrnStr': ogrnStr.text,
        'vidt': vidt.text,
        'marka': marka.text,
        'godv': godv.text,
        'maxgruz': maxgruz.text,
        'dkuzov': dkuzov.text,
        'shkuzov': shkuzov.text,
        'vidk': vidk.text,
        'cenahaurs': cenahaurs.text,
        'cenasmena': cenasmena.text,
        'cenakm': cenakm.text,
      },
    );

    final data = jsonDecode(response.body);

    if (data['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful')),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Failed: ${data['error']}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                  controller: rollNum,
                  decoration: InputDecoration(labelText: 'Roll Number')),
              TextFormField(
                  controller: statNum,
                  decoration: InputDecoration(labelText: 'State Number')),
              TextFormField(
                  controller: firstName,
                  decoration: InputDecoration(labelText: 'First Name')),
              TextFormField(
                  controller: middleName,
                  decoration: InputDecoration(labelText: 'Middle Name')),
              TextFormField(
                  controller: lastName,
                  decoration: InputDecoration(labelText: 'Last Name')),
              TextFormField(
                  controller: city,
                  decoration: InputDecoration(labelText: 'City')),
              TextFormField(
                  controller: phone,
                  decoration: InputDecoration(labelText: 'Phone')),
              TextFormField(
                  controller: email,
                  decoration: InputDecoration(labelText: 'Email')),
              TextFormField(
                  controller: password,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true),
              TextFormField(
                  controller: namefirm,
                  decoration: InputDecoration(labelText: 'Firm Name')),
              TextFormField(
                  controller: innStr,
                  decoration: InputDecoration(labelText: 'INN')),
              TextFormField(
                  controller: ogrnStr,
                  decoration: InputDecoration(labelText: 'OGRN')),
              TextFormField(
                  controller: vidt,
                  decoration: InputDecoration(labelText: 'Vehicle Type')),
              TextFormField(
                  controller: marka,
                  decoration: InputDecoration(labelText: 'Brand')),
              TextFormField(
                  controller: godv,
                  decoration: InputDecoration(labelText: 'Year of Production')),
              TextFormField(
                  controller: maxgruz,
                  decoration: InputDecoration(labelText: 'Max Load capacity')),
              TextFormField(
                  controller: dkuzov,
                  decoration: InputDecoration(labelText: 'Body Length')),
              TextFormField(
                  controller: shkuzov,
                  decoration: InputDecoration(labelText: 'Body Width')),
              TextFormField(
                  controller: vidk,
                  decoration: InputDecoration(labelText: 'Body Type')),
              TextFormField(
                  controller: cenahaurs,
                  decoration: InputDecoration(labelText: 'Price per hour')),
              TextFormField(
                  controller: cenasmena,
                  decoration: InputDecoration(labelText: 'Price per shift')),
              TextFormField(
                  controller: cenakm,
                  decoration: InputDecoration(labelText: 'Price per km')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
