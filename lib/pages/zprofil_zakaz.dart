import 'package:flutter/material.dart';

import '../design/colors.dart';

import 'exit.dart';
import 'zprofil_m.dart';

class zprofil_zakaz extends StatefulWidget {
  const zprofil_zakaz({super.key});

  @override
  zprofil_zakazForm createState() => zprofil_zakazForm();
}

class zprofil_zakazForm extends State<zprofil_zakaz> {
  // var _currentPage = 0;
  final _currentPage = 0;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violetColor,
        iconTheme: const IconThemeData(color: whiteprColor),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Заказы',
              style: TextStyle(color: whiteprColor, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    // Первый текст выровнен слева
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Санкт-Петербург'),
                      ),
                    ),
                    // Картинка выровнена по центру
                    Image.asset(
                      'assets/images/strelkaleftblue.png', // путь к изображению
                    ),
                    // Второй текст выровнен справа
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Москва'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Загрузка 13.04.24 "),
                    Text("Выгрузка 17.04"),
                  ],
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Исполнитель:"),
                    Text("Вы не выбрали"),
                  ],
                ),
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
                    backgroundColor: violetColor,
                    disabledForegroundColor: grayprprColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const zprofil_m()));
                  },
                  child: const Text('Детали...'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    // Первый текст выровнен слева
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Санкт-Петербург'),
                      ),
                    ),
                    // Картинка выровнена по центру
                    Image.asset(
                      'assets/images/strelkaleftblue.png', // путь к изображению
                    ),
                    // Второй текст выровнен справа
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Москва'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Загрузка 13.04.24 "),
                    Text("Выгрузка 17.04"),
                  ],
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Исполнитель:"),
                    Text("Владимир"),
                  ],
                ),
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
                    backgroundColor: violetColor,
                    disabledForegroundColor: grayprprColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CustomLayout()));
                  },
                  child: const Text('Детали...'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
