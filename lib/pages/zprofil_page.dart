import 'dart:typed_data';

import '../design/colors.dart';
import 'ads1.dart';
import 'ads2.dart';
import 'loginpage.dart';
import 'rent_z.dart';
import 'subscription_screen.dart';
import 'zakaz_screen.dart';
import 'zprofil_ld.dart';
import 'zprofil_zakaz.dart';
import 'zprofile_izbrannoe.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class zprofil_name extends StatefulWidget {
  const zprofil_name({super.key});

  @override
  zprofil_nameForm createState() => zprofil_nameForm();
}

class zprofil_nameForm extends State<zprofil_name> {
  final _currentPage = 0;
  bool isSwitched = false;
  Uint8List? fotouser;
  String firstName = '';
  String lastName = '';
  String middleName = '';
  String city = '';
  String phone = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final token = await getSecureToken(); // Await the secure token
    if (token == null) {
      print("Token is null");
      return;
    }
    final response = await http
        .get(Uri.parse('https://ivnovav.ru/api/getuserinfo.php?token=$token'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['error'] != null) {
        print('Ошибка: ${data['error']}');
      } else {
        // Обновляем поля класса и UI
        setState(() {
          firstName = data['firstName'];
          lastName = data['lastName'];
          middleName = data['middleName'];
          city = data['city'];
          phone = data['phone'];
          email = data['email'];
          // Проверяем, есть ли изображение пользователя и преобразуем его из base64.
          fotouser =
              data['fotouser'] != null ? base64Decode(data['fotouser']) : null;
        });

        // Теперь переменные firstName, lastName, middleName, и userfoto доступны для использования в build() методе.
      }
    } else {
      print('Ошибка при получении данных пользователя');
    }
  }

  Future<String?> getSecureToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('789456123'); // Получаем токен
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/bgcolor_head_blue_white.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                // Центрируем изображение
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: fotouser != null
                      ? Image.memory(
                          fotouser!,
                          // fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/fotouser.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                '$firstName $lastName', // Интерполяция используется для вставки значений
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: TexticonsColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const zprofil_ld()));
                  },
                  child: const Text('Личные данные')),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: TexticonsColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Ads2App()));
                  },
                  child: const Text('Мои объявления')),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: TexticonsColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const zprofil_zakaz()));
                  },
                  child: const Text('Статус заказа')),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: TexticonsColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const zprofile_izbrannoe()));
                  },
                  child: const Text('Избранное')),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 40.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () => _showExitConfirmationDialog(context),
                child: const Text('Выйти из аккаунта'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
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
                          MaterialPageRoute(builder: (_) => RentDateForm()));
                    },
                    child: const Text('MyApp')),
              ),
            ),
            // _getScreen(),
          ],
        ),
      ),
    );
  }
}

class _showExitConfirmationDialog {
  _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выход'),
          content: const Text('Вы уверены, что хотите выйти?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалоговое окно
              },
            ),
            TextButton(
                child: const Text('Да'),
                onPressed: () async {
                  // Получение экземпляра SharedPreferences
                  final prefs = await SharedPreferences.getInstance();

// Логирование значения перед его удалением
                  final token = prefs.getString('789456123');
                  print('Token before deletion: $token');

// Удаление токена, обернутое в try-catch для перехвата ошибок
                  try {
                    await prefs.remove('789456123');
                    print('Token has been successfully removed.');

                    // Дополнительная проверка для убеждения, что ключ был удален
                    final tokenAfterDeletion = prefs.getString('789456123');
                    print('Token after deletion: $tokenAfterDeletion');
                  } catch (e) {
                    print('Error removing token: $e');
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                }),
          ],
        );
      },
    );
  }
}
