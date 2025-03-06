import 'package:crgtransp72app/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'change_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final token = getSecureToken(); // Await the secure token7
    Timer(const Duration(seconds: 5), () {
      //Navigator.of(context).pushReplacement(
      //  MaterialPageRoute(builder: (context) => const LoginPage()));
      if (token == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => change_user()),
        );
      }
    });
  }

  Future<String?> getSecureToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('789456123'); // Получаем токен
    print(token);
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // путь к изображению
          width: 189, // ширина изображения
          height: 119, // высота изображения
        ),
      ),
    );
  }
}
