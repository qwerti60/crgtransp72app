import 'package:flutter/material.dart';

import '../design/colors.dart';
import 'gruz_vodit2.dart';

//import 'reguser2_page_.dart';

// Step 1.
String dropdownValue = 'Абатское';

class gruz_vodit extends StatefulWidget {
  const gruz_vodit({super.key});

  @override
  gruz_voditForm createState() => gruz_voditForm();

}

class gruz_voditForm extends State<gruz_vodit> {
   var _currentPage = 0;
  bool isSwitched = false; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.0), // Высота AppBar
          child: AppBar(
            backgroundColor:GreenColor,
            flexibleSpace: Padding(
padding: const EdgeInsets.symmetric(vertical:  40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: whiteprColor,
                        filled: true,
                        hintText: 'Искать...',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0), // Расстояние между строками
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
// Действие для кнопки "Фильтр"
                        },
                        child: Text("Фильтр"),
                        style: OutlinedButton.styleFrom(
                    foregroundColor:  blackprColor,
                    backgroundColor:whiteprColor,
                    disabledForegroundColor: whiteprColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
// Действие для кнопки "Мои заказы"
                        },
                        child: Text("Мои заказы"),
                        style: OutlinedButton.styleFrom(
                    foregroundColor:  blackprColor,
                    backgroundColor:whiteprColor,
                    disabledForegroundColor: whiteprColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("№04294354",                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
          IconButton(
            icon: Icon(Icons.favorite, color: GreenColor), // Иконка лайка
            onPressed: () {
              // Действие при нажатии иконки
            },),
           ],
            ),
          ),          ),  
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
        Flexible(
          child: Text(
            "Описание: Строительные материалы на паллетах 20 шт.",
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  ),
),
   

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
                Text("703 км"),
                   Text("44 444 р.",                
                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color:  GreenColor,
                )),
           ],
            ),
          ),          ),             
                           Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("№04294354",                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
          IconButton(
            icon: Icon(Icons.favorite, color: GreenColor), // Иконка лайка
            onPressed: () {
              // Действие при нажатии иконки
            },),
           ],
            ),
          ),          ),  
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
        Flexible(
          child: Text(
            "Описание: Строительные материалы на паллетах 20 шт.",
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  ),
),  

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
                Text("703 км"),
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
                  child: const Text('Груз водителя 2'),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    foregroundColor: whiteprColor,
                    backgroundColor: GreenColor,
                    disabledForegroundColor: grayprprColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>gruz_vodit2()));

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
            icon: Icon(Icons.history),
            label: 'История',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
               type: BottomNavigationBarType.fixed,      
                  currentIndex: _currentPage,
          fixedColor: GreenColor,
          onTap: (int intIndex) {
            setState(() {
              _currentPage = intIndex;
            });
          },
      ),  
      ),
    );
  }
}
