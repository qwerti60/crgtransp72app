import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/dimension.dart';

import 'reguser_name_.dart';

//import 'reguser2_page_.dart';

// Step 1.
String dropdownValue = 'Мини погрузчики и складская техника';

class creguser5_name_ extends StatefulWidget {
  const creguser5_name_({super.key});

  @override

  // ignore: library_private_types_in_public_api

  _creguser5_nameForm createState() => _creguser5_nameForm();
}

class _creguser5_nameForm extends State<creguser5_name_> {
  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.only(top: 15.0),
              child: const Text(
                'Вид спецтехники',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 60,
              width: double.infinity - 20,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black38, width: 3),
                color: Colors.black38,
              ),
// Step 2.
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  // Step 3.
                  value: dropdownValue,
                  isExpanded: true,
                  underline: Container(),

                  alignment: Alignment.bottomCenter,

                  elevation: 0,
                  dropdownColor: grayprprColor,
                  // Step 4.
                  items: <String>[
                    'Мини погрузчики и складская техника',
                    'Мини экскаваторы',
                    'Мусоровозы, бункеровозы и ломовозы',
                    'Тралы и низкорамные платформы',
                    'Комунально-дорожные машины',
                    'Самосвалы и тонары',
                    'Тракторы и сельхоз иехника',
                    'Фронтальные и телескопические погрузчики',
                    'Эвакуаторы и автовозы',
                    'Эксковаторы',
                    'Эксковаторы-погрузчики',
                    'Ямобуры и сваебои',
                    'Бульдозеры',
                    'Гидромолоты',
                    'Грейдеры',
                    'Грейферные погрузчики',
                    'Дорожные катки и асфальтоукладчики',
                    'Манипуляторы',
                    'Автобетононасосы',
                    'Автовышки',
                    'Ассенизаторы и илососы',
                    'Бензовозы и автоцистерны',
                    'Бероновозы и цементовозы'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Продолжить'),
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
                        MaterialPageRoute(builder: (_) => creguser_name_()));
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
