import 'package:flutter/material.dart';

import '../design/colors.dart';
import 'gruz_vodit4.dart';
import 'vod_zak2.dart';

//import 'reguser2_page_.dart';

// Step 1.
String dropdownValue = 'Абатское';

class vod_zak1 extends StatefulWidget {
  const vod_zak1({super.key});

  @override
  vod_zak1Form createState() => vod_zak1Form();

}

class vod_zak1Form extends State<vod_zak1> {
   var _currentPage = 0;
  bool isSwitched = false; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: violetColor,
        iconTheme: IconThemeData(color: whiteprColor),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Водители',
              style: TextStyle(color: whiteprColor, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white), // Иконка лайка
            onPressed: () {
              // Действие при нажатии иконки
            },
          ),
        ],
          leading: IconButton(
    icon: Icon(Icons.arrow_back),
    color: whiteprColor,
    onPressed: () {
      Navigator.pop(context);
    },
  ),
      ),
        
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                          Container(
            child: Image.asset(
              'assets/images/car.png', // путь к изображению
            ),            ),


                        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("DAF XF 440 FT"),
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
                Text("Контакты"),
              ],
            ),
          ),          ),      
                 Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Номер телефона:"),
                Text("+7 999 888-77-66"),
              ],
            ),
          ),          ),                    
                 Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Адрес"),
                Text("Москва"),
              ],
            ),
          ),          ),                    

                  Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Владимир"),
                   Text(" 76 р./км",                
                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
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
                  child: const Text('Выбрать водителем'),
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
                      context, MaterialPageRoute(builder: (_) =>gruz_vodit4()));

                },
                ),
              ),
            ),     
  
                         Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Груз водителя 4'),
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
                      context, MaterialPageRoute(builder: (_) =>vod_zak2()));

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
          fixedColor: violetColor,
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