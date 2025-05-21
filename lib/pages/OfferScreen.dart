// TODO Implement this library.
import 'package:crgtransp72app/pages/change_user.dart';
import 'package:flutter/material.dart';

import '../design/colors.dart';
//import 'reguser1_name.dart';
import '../config.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'ads2.dart';

class OfferScreen extends StatefulWidget {
  final String userid;

  final dynamic bd;
  //final int bd;
  const OfferScreen({super.key, required this.userid, required this.bd});

  @override

  // ignore: library_private_types_in_public_api

  _OfferscreenForm createState() => _OfferscreenForm();
}

class _OfferscreenForm extends State<OfferScreen> {
  final TextEditingController _cenakmController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  late String userid; // Используйте правильные типы данных для вашей переменной
  late int bd;
  int userIdp = 0;
  @override
  void initState() {
    super.initState();
    userid = widget.userid;
    bd = widget.bd;
    getUserData();
    /////  checkOfferExists(userId, userIdp as String, bd);
    fetchOfferData(userId, userid, bd);
  }

  Future<void> fetchOfferData(int iduserp, String userId, int bd) async {
    final response = await http.post(
      Uri.parse(
          'https://ivnovav.ru/api/fetch_offer.php'), // заменить на ваш сервер
      body: {'iduserp': '$iduserp', 'userId': '$userId', 'bd': '$bd'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      _cenakmController.text = data['cena'] ?? '';
      print(_cenakmController.text);
      _aboutController.text = data['about'] ?? '';
      print(_aboutController.text);
    } else {
      print('Ошибка загрузки данных');
    }
    print('вывод idp: $iduserp');
    print('вывод id: $userId');
    print('вывод bd: $bd');
  }

  String firstName = '';
  String lastName = '';
  String middleName = '';
  String city1 = '';
  String phone = '';
  String email = '';
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
          userIdp = data['idusers'];
          firstName = data['firstName'];
          lastName = data['lastName'];
          middleName = data['middleName'];
          city1 = data['city'];
          phone = data['phone'];
          email = data['email'];
        });
        print('вывод id: $userIdp');
        // Теперь переменные firstName, lastName, middleName доступны для использования в build() методе
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

  void uploadData() async {
    var uri = Uri.parse('http://ivnovav.ru/api/add_offer.php');

// Предполагаем, что _images и _imagesDoc - это пути к файлам на устройстве
    var request = http.MultipartRequest('POST', uri)
      ..fields['cena'] = _cenakmController.text
      ..fields['about'] = _aboutController.text
      ..fields['iduserp'] = userIdp.toString()
      ..fields['iduser'] = userid //ид объявы
      ..fields['bd'] = bd.toString();

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Uploaded!');
      print('Uploaded!');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Ads2App(),
        ),
      );
    } else {
      print('Failed!');
    }
    print('userIdp');
    print(userIdp);
    print('userid');
    print(userid);
    print(bd);
  }

  Future<bool> checkOfferExists(int userId, String truckId, int bd) async {
    final response = await http.get(Uri.parse(
        'https://ivnovav.ru/api/check_offer.php?iduser=$userId&truck=$truckId&bd=$bd'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['exists'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Предложение услуги',
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(top: 15.0),
              child: const Text(
                'Цена',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _cenakmController,
                decoration: const InputDecoration(
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
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(top: 15.0),
              child: const Text(
                'Текст предложения',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black38,
                  width: 2,
                ),
                color: grayprprColor, // Используйте вашу переменную цвета здесь
              ),
              child: TextField(
                controller: _aboutController,
                keyboardType:
                    TextInputType.multiline, // Делаем поле многострочным
                maxLines: null, // Без ограничения на количество строк
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  border: InputBorder.none, // Убираем внутреннюю рамку
                  // Добавьте другие настройки декорации здесь, если это необходимо
                ),
                // Добавьте другие настройки TextField здесь, если это необходимо
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 30.0),
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
                    onPressed: () async {
                      String about = _aboutController.text;
                      String cena = _cenakmController.text;

                      if (about.isEmpty) {
// Если хотя бы одно поле пустое, показываем осведомительное сообщение
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Пожалуйста, заполните все поля.'),
                          ),
                        );
                        return;
                      }
                      uploadData();
                    },
                    child: const Text('Отправить предложение')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
