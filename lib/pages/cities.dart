import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _validateEmail(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  bool _validatePhone(String phone) {
    final RegExp regex = RegExp(r'^\+?[0-9]{10,15}$');
    return regex.hasMatch(phone);
  }

  bool _validatePassword(String password) {
    final RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(password);
  }

  Future _registerUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final phone = _phoneController.text;

      if (!_validateEmail(email)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Введите корректный email')));
        return;
      }

      if (!_validatePassword(password)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Пароль должен быть не менее 8 символов, содержать буквы и цифры')));
        return;
      }

      if (!_validatePhone(phone)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Введите корректный номер телефона')));
        return;
      }
      final response = await http.post(
        Uri.parse('http://ivnovav.ru/regtest.php'),
        body: json.encode({
          'email': email,
          'password': password,
          'phone': phone,
          'rollNum': 123, // пример данных из предыдущего окна
          'statNum': 456, // пример данных из предыдущего окна
          'firstName': 'John', // пример данных из предыдущего окна
          'lastName': 'Doe', // пример данных из предыдущего окна
          'middleName': 'Middle', // пример данных из предыдущего окна
        }),
      );

      final responseData = json.decode(response.body);

      if (responseData['status'] == 'error') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(responseData['message'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Регистрация успешна')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Телефон'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
