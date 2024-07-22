import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/dimension.dart';
import 'loginpage.dart';
import 'reguser5_page_.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';
import 'reguser_name.dart';

class creguser4_name_ extends StatefulWidget {
  final int statNum;
  final int rollNum;
  final String firstName;
  final String middleName;
  final String lastName;
  final String city;
  final String phone;
  final String email;
  final String password;

  const creguser4_name_({
    required this.statNum,
    required this.rollNum,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.city,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  // ignore: library_private_types_in_public_api

  _creguser4_nameForm createState() => _creguser4_nameForm();
}

class _creguser4_nameForm extends State<creguser4_name_> {
  late int statNum;
  late int rollNum;
  late String firstName;
  late String middleName;
  late String lastName;
  late String city;
  late String phone;
  late String email;
  late String password;
  @override
  void initState() {
    super.initState();

    // Инициализация переменных значениями, переданными через виджет
    statNum = widget.statNum;
    rollNum = widget.rollNum;
    firstName = widget.firstName;
    middleName = widget.middleName;
    lastName = widget.lastName;
    city = widget.city;
    phone = widget.phone;
    email = widget.email;
    password = widget.password;
  }

  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _innController = TextEditingController();
    final TextEditingController _kppController = TextEditingController();
    final TextEditingController _ogrnController = TextEditingController();
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
                'Наименование',
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
                controller: _nameController,
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
                  hintText: 'ООО «Иванов»',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'ИНН',
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
                controller: _innController,
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
                  hintText: '1223334444',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'КПП',
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
                controller: _kppController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  hintText: '122333444',
                  fillColor: grayprprColor,
                  filled: true,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'ОГРН',
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
                controller: _ogrnController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: blueaccentColor),
                  ),
                  hintText: '1223334444555',
                  fillColor: grayprprColor,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(rollNum == 1 && statNum == 1
                      ? 'Регистрация'
                      : 'Продолжить'), //                 child: const Text('Продолжить'),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    foregroundColor: whiteprColor,
                    backgroundColor: blueaccentColor,
                    disabledForegroundColor: grayprprColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                  onPressed: () {
                    String innStr = _innController.text;
                    String ogrnStr = _ogrnController.text;
                    String namefirm = _nameController.text;
                    String kppStr = _kppController.text;
                    bool _isNumeric(String str) {
                      return RegExp(r'^[0-9]+$').hasMatch(str);
                    }

                    //перевозчик юр лицо
                    if (rollNum == 2 && statNum == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => creguser_name(
                                    rollNum: rollNum,
                                    statNum: statNum,
                                    firstName: firstName,
                                    middleName: middleName,
                                    lastName: lastName,
                                    city: city,
                                    phone: phone,
                                    email: email,
                                    password: password,
                                    namefirm: namefirm,
                                    innStr: innStr,
                                    ogrnStr: ogrnStr,
                                    kppStr: kppStr,
                                    vidt: '',
                                  )));
                    }
                    if (rollNum == 3 && statNum == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => creguser5_name_(
                                    rollNum: rollNum,
                                    statNum: statNum,
                                    firstName: firstName,
                                    middleName: middleName,
                                    lastName: lastName,
                                    city: city,
                                    phone: phone,
                                    email: email,
                                    password: password,
                                    namefirm: namefirm,
                                    innStr: innStr,
                                    ogrnStr: ogrnStr,
                                    kppStr: kppStr,
                                  )));
                    }
                    //заказчик юр лицо
                    if (rollNum == 1 && statNum == 1) {
                      if (namefirm.isEmpty ||
                          ogrnStr.isEmpty ||
                          kppStr.isEmpty ||
                          innStr.isEmpty == null) {
// Если хотя бы одно поле пустое, показываем осведомительное сообщение
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Пожалуйста, заполните все поля'),
                          ),
                        );
                        return;
                      } else if (!_isNumeric(innStr) ||
                          !_isNumeric(ogrnStr) ||
                          !_isNumeric(kppStr)) {
// Если хотя бы одно поле пустое, показываем осведомительное сообщение
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'ИНН, ОГОН, КПП должны содержать только цифры'),
                          ),
                        );
                        return;
                      }
                      Future register() async {
                        final response = await http.post(
                          Uri.parse(Config.baseUrl)
                              .replace(path: '/api/regul.php'),
                          body: {
                            'rollNum': rollNum.toString(),
                            'statNum': statNum.toString(),
                            'firstName': firstName,
                            'middleName': middleName,
                            'lastName': lastName,
                            'city': city,
                            'phone': phone,
                            'email': email,
                            'password': password,
                            'namefirm': namefirm,
                            'innStr': innStr,
                            'ogrnStr': ogrnStr,
                            'kppStr': kppStr,
                          },
                        );

                        if (response.statusCode == 200) {
                          print(response.body);
                          final data = json.decode(response.body);

                          if (data['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Регистрация успешна!')));
// Перейти на экран авторизации
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Ошибка: ${data['message']}')));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ошибка сервера')));
                        }
                      }

                      register();
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
