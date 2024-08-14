// Импортируйте нужные пакеты
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    var url = 'http://ivnovav.ru/api/autoriz.php';
    var response = await http.post(
      Uri.parse(url),
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
              context, MaterialPageRoute(builder: (context) => OrdersPage()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrdersPage()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrdersPage()));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(onPressed: _login, child: Text('Войти'))
          ],
        ),
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Здесь ваш UI для страницы приема заказов
    return Scaffold(
      appBar: AppBar(
        title: Text('Прием заказов'),
      ),
      body: Center(
        child: Text('Добро пожаловать на страницу приема заказов!'),
      ),
    );
  }
}
