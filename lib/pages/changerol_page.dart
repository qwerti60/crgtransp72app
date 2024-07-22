import 'package:crgtransp72app/design/colors.dart';
import 'package:flutter/material.dart';

import '../design/dimension.dart';
import 'changestatis_page.dart';

class changerol extends StatefulWidget {
  const changerol({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _changerolForm createState() => _changerolForm();
}

class _changerolForm extends State<changerol> {
  int _valueRole = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выбор роли',
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
            Text('Выберите свою роль',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackprColor,
                  fontSize: fontSize30,
                )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: const Text('Заказчик'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: _valueRole,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _valueRole = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Грузоперевозчик'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: _valueRole,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 25, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _valueRole = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Услуги спецтехники'),
                    leading: Radio<int>(
                      value: 3,
                      groupValue: _valueRole,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 25, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _valueRole = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chagestatus(data: _valueRole),
                      ),
                    );
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
