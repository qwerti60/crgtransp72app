import 'package:flutter/material.dart';

import '../design/colors.dart';

import 'gruz_vodit8.dart';

//import 'reguser2_page_.dart';

// Step 1.
String dropdownValue = 'Абатское';

class gruz_vodit6 extends StatefulWidget {
  const gruz_vodit6({super.key});

  @override
  gruz_vodit6Form createState() => gruz_vodit6Form();

}

class gruz_vodit6Form extends State<gruz_vodit6> {
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
                Text("Загрузка 13.04"),
                Text("Выгрузка 17.04"),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Исполнитель:"),
                Text("Найден"),
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
                Text("Загрузка 13.04"),
                Text("Выгрузка 17.04"),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Исполнитель:"),
                Text("Найден"),
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
                Text("Загрузка 13.04"),
                Text("Выгрузка 17.04"),
              ],
            ),
          ),          ),             
              Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Исполнитель:"),
                Text("Найден"),
              ],
            ),
          ),          ),             
                         Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Груз водителя 6'),
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
                      context, MaterialPageRoute(builder: (_) =>gruz_vodit8()));

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
