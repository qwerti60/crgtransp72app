import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../design/colors.dart'; // Ensure you have this file with color definitions

int userId = 0;

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});
//class change_user extends StatefulWidget {
  //const change_user({super.key});

  @override

  // ignore: library_private_types_in_public_api

  SubscriptionForm createState() => SubscriptionForm();
}

class SubscriptionForm extends State<SubscriptionScreen> {
  Future fetchSubscriptionInfo(int userid) async {
    final response = await http.get(Uri.parse(
        'https://ivnovav.ru/api/get_subscribe_data.php?userid=$userid'));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['message'];
    } else {
      throw Exception('Failed to load subscription info');
    }
  }

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
          userId = data['idusers'];
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
      appBar: AppBar(
        title: const Text(
          'Подписка',
          style: TextStyle(
            color:
                whiteprColor, // Ensure this color is defined in your colors.dart file
          ),
        ),
        backgroundColor:
            blueaccentColor, // Ensure this color is defined in your colors.dart file
      ),
      body: FutureBuilder(
        future: fetchSubscriptionInfo(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
// Use a Column widget to organize the text and button
            return Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align content in the center of the screen vertically
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Stretch content across the screen horizontally
              children: [
// This centers the text horizontally
                Center(
                  child: Text(
                    snapshot.data ?? 'No data', // Display the fetched message
                    textAlign: TextAlign.center, // Center align text
                  ),
                ),
// Add some space before the button
                const SizedBox(height: 20),
// This button is placed at the bottom
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0), // Add some padding around the button
                  child: // Виджет ElevatedButton внутри вашего Stateful или Stateless виджета.
                      ElevatedButton(
                    onPressed: snapshot.data != null
                        ? () {
                            // Преобразование строки в DateTime с проверкой
                            DateTime parsedDate = DateTime.tryParse(
                                    snapshot.data) ??
                                DateTime.now().add(Duration(
                                    days:
                                        -1)); // Если не удастся разобрать строку, используется "невалидная" дата, чтобы кнопка была неактивной.
                            // Проверка, если дата не более 30 дней назад, то кнопка активна
                            if (DateTime.now().difference(parsedDate).inDays <=
                                1) {
                              _showRenewSubscriptionDialog(context);
                            }
                          }
                        : null, // Кнопка будет неактивной, если условие не выполнено
                    child: Text('Продлить подписку'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      disabledBackgroundColor: Colors.grey.withOpacity(
                          0.12), // Используйте корректную переменную для белого цвета
                      backgroundColor: Colors
                          .blueAccent, // Используйте корректную переменную для цвета акцента
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _showRenewSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Продлить подписку'),
          content: Text('Вы уверены, что хотите продлить подписку на 30 дней?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                try {
                  await renewSubscription(
                      userId); // Вызов функции обновления с dummy userID
                  Navigator.of(context).pop(); // Закрываем всплывающее окно
                  setState(() {
                    fetchSubscriptionInfo(userId);
                    // Ваш код для обновления состояния, который повлияет на UI
                  });
                } catch (e) {
                  print(e); // Выводим ошибку, если что-то пошло не так
                }
              },
              child: Text('Да'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Просто закрывает диалоговое окно
              },
              child: Text('Нет'),
            ),
          ],
        );
      },
    );
  }
}

Future<void> renewSubscription(int userID) async {
  var url = Uri.parse('https://ivnovav.ru/api/subscribe_new.php');
  var response = await http.post(url, body: {'iduser': userID.toString()});

  if (response.statusCode == 200) {
    // Если сервер возвращает "OK", то парсим JSON
    var jsonResponse = jsonDecode(response.body);
    print('Ответ от сервера: $jsonResponse');
  } else {
    // Если сервер вернул ответ, отличный от 200 OK,
    // то выбрасываем исключение
    throw Exception('Failed to renew subscription.');
  }
}
