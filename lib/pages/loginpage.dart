//import 'dart:ffi';

import 'dart:convert';

import 'package:crgtransp72app/design/colors.dart';
import 'package:crgtransp72app/pages/changerol_page.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../design/dimension.dart';
import 'cities.dart';
import 'gruz_vodit.dart';
//import 'profil_page.dart';
import 'register_screen.dart';
import 'vod_zak.dart';
import 'zprofil_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  var login;
  var password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    //var url = 'http://ivnovav.ru/api/autoriz.php';
    var response = await http.post(
      Uri.parse(Config.baseUrl).replace(path: '/api/autoriz.php'),
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    var json = jsonDecode(response.body);

// Проверяем rollNum и statNum и переходим на соответствующий экран
    if (json['success'] != null && json['success']) {
      // Проверяем rollNum и выполняем навигацию
      switch (json['rollNum']) {
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => zprofil_name()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => zprofil_name()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => gruz_vodit()));
          break;
        default:
          // Обработка, если rollNum не соответствует ожидаемым значениям
          break;
      }
    } else {
// Выводим сообщение об ошибке
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(json['message']),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Авторизация',
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
            Text('Авторизация',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackprColor,
                  fontSize: fontSize30,
                )),
            /*Text('Логин',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 25.0,
                )),*/
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 30.0),
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
                  prefixIcon: Icon(Icons.person),
                  hintText: 'E-mail',
                  fillColor: grayprprColor,
                  filled: true,
                ),
                onChanged: (value) {
                  login = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Пароль',
                  fillColor: grayprprColor,
                  filled: true,
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('Войти'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      _login();
                    }),
              ),
            ),
            /*Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('cites'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MyApp()));
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('Войти как водитель'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => zprofil_name()));
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('Войти как заказчик'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => zprofil_name()));
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('Грузы водителя'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => gruz_vodit()));
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    child: const Text('Водители заказчика'),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(double.infinity, 50),
                      foregroundColor: whiteprColor,
                      backgroundColor: blueaccentColor,
                      disabledForegroundColor: grayprprColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => vod_zak()));
                    }),
              ),
            ),*/
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 80.0),
              child: TextButton(
                child: const Text('Регистрация'),
                style: TextButton.styleFrom(
                  foregroundColor: blueaccentColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => changerol()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

signup(login, password) async {
  var url = "127.0.0.1:5000";
  final response = await http.post(
    url as Uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'login': login,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
