import 'package:crgtransp72app/config.dart';
import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/dimension.dart';

import 'reguser_name_.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: const Text(
          'Регистрация',
          style: TextStyle(
            color: whiteprColor,
          ),
        ),
        backgroundColor: blueaccentColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Image.asset(
              'assets/images/logo.png', // путь к изображению
              width: 189, // ширина изображения
              height: 119, // высота изображения
            ),
            Text('Регистрация',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackprColor,
                  fontSize: fontSize30,
                )),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 5.0),
              child: const Text(
                'Номер телефона',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  fillColor: grayprprColor,
                  filled: true,
                  // hintText: '8(999) 888 77-66',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'Эл. почта',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  fillColor: grayprprColor,
                  filled: true,
                  hintText: 'ivanov@yandex.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'Пароль',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  hintText: '150',
                  fillColor: grayprprColor,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(rollNum == 1 && statNum == 2
                      ? 'Регистрация'
                      : 'Продолжить'),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    disabledForegroundColor: Colors.grey,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  onPressed: () async {
                    bool _validateEmail(String email) {
                      final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      return regex.hasMatch(email);
                    }

                    bool _validatePhone(String phone) {
                      final RegExp regex = RegExp(r'^\+?[0-9]{10,15}$');
                      return regex.hasMatch(phone);
                    }

                    bool _validatePassword(String password) {
                      final RegExp regex =
                          RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
                      return regex.hasMatch(password);
                    }

                    if (rollNum == 1 && statNum == 2) {
                      String phone = _phoneController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      if (phone.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty == null) {
// Если хотя бы одно поле пустое, показываем осведомительное сообщение
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Пожалуйста, заполните все поля и выберите город.'),
                          ),
                        );
                        return;
                      } else if (!_validatePhone(phone)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Введите корректный номер телефона')));
                        return;
                      } else if (!_validateEmail(email)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Введите корректный email')));
                        return;
                      } else if (!_validatePassword(password)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Пароль должен быть не менее 8 символов, содержать буквы и цифры')));
                        return;
                      }

                      final response = await http.post(
                        Uri.parse(Config.baseUrl).replace(path: 'regtest.php'),
                        body: json.encode({
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'phone': _phoneController.text,
                          'rollNum':
                              rollNum, // пример данных из предыдущего окна
                          'statNum':
                              statNum, // пример данных из предыдущего окна
                          'firstName':
                              firstName, // пример данных из предыдущего окна
                          'lastName':
                              lastName, // пример данных из предыдущего окна
                          'middleName':
                              middleName, // пример данных из предыдущего окна
                          'city': city,
                        }),
                      );

                      final responseData = json.decode(response.body);

                      if (responseData['status'] == 'error') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(responseData['message'])));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Регистрация успешна')));
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
