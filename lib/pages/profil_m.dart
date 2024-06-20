import 'package:flutter/material.dart';

import '../design/colors.dart';


class profil_m extends StatefulWidget {
  const profil_m({super.key});

  @override
  profil_mForm createState() => profil_mForm();

}

class profil_mForm extends State<profil_m> {
 // var _currentPage = 0;
  var _currentPage = 0;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenColor,
          iconTheme: IconThemeData(
    color: whiteprColor
  ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Маршрут и груз',
                style: TextStyle(color: whiteprColor, fontSize: 18),
              ),
              Text(
                '№04294354',
                style: TextStyle(color: whiteprColor, fontSize: 14),
              ),
            ],
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white), // Иконка лайка
            onPressed: () {
              // Действие при нажатии иконки
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                          Container(
            child: Image.asset(
              'assets/images/map.png', // путь к изображению
            ),            ),
                          Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                // Первый текст выровнен слева
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Санкт-Петербург'),
                  ),
                ),
                // Картинка выровнена по центру
                Image.asset(
                  'assets/images/strelkaleft.png', // путь к изображению
                ),
                // Второй текст выровнен справа
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Москва'),
                  ),
                ),
              ],
            ),
          ),            ),             
                        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Загрузка 13.04.24 "),
                Text("с 10:00 до 18:00"),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Выгрузка 17.04.24"),
                Text("с 10:00 до 18:00"),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Описание: "),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Строительные материалы на паллетах 20 шт."),
              ],
            ),
          ),          ),     
               Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Тип кузова"),
                Text("Тентованный"),
              ],
            ),
          ),          ),             
                Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Вес, т."),
                Text("11 т."),
              ],
            ),
          ),          ),             
                Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Загрузка"),
                Text("Бортовая"),
              ],
            ),
          ),          ),             
                 Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Тип груза:"),
                Text("Штучный"),
           ],
            ),
          ),          ),             
                  Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("703 км"),
                Text("80 р./км"),
                   Text("44 444 р.",                
                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color:  GreenColor,
                )),
           ],
            ),
          ),          ),             
              
               Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Отменить заявку'),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    foregroundColor: whiteprColor,
                    backgroundColor: GreenColor,
                    disabledForegroundColor: grayprprColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                onPressed: () {
                },
                ),
              ),
            ),     
          ],
        ),
      ),       
            bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.fire_truck),
            label: 'Техника',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
                  currentIndex: _currentPage,
          fixedColor: GreenColor,
          onTap: (int intIndex) {
            setState(() {
              _currentPage = intIndex;
            });
          },
      ),
    );
  }
}