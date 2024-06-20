import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/dimension.dart';
import 'reguser1_name.dart';
import 'reguser1_name_.dart';

class chagestatus extends StatefulWidget {
  final int data;
  chagestatus({required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _changestatusForm createState() => _changestatusForm();
}

class _changestatusForm extends State<chagestatus> {
  String strData = '';
  String status = 'Юр лицо';

  @override
  void initState() {
    super.initState();
    if (widget.data == 1) {
      strData = 'заказчика';
    } else if (widget.data == 2) {
      strData = 'грузоперевозчика';
    }
  }
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выбор статуса',
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
            Text('Выберите статус',
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
                    title: const Text('Юр. лицо'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: _value,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Физ. лицо'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: _value,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 25, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
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
                        builder: (context) => chagestatus(data: _value),
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




  Widget build(BuildContext context) {
    int _value = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Выбор статуса $strData",
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
            Text('Выберите свой статус',
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
                    title: const Text('Юр. лицо '),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: _value,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: materialTextSelectionControls. MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Физ. лицо'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: _value,
                      activeColor:
                          blueaccentColor, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          blueaccentColor), // Change the fill color when selected
                      splashRadius: 25, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
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
                    if (_value == 2)
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => creguser1_name()));
                    if (_value == 1)
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => creguser1_name_()));
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
