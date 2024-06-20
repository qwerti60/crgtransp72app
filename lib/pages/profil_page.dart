import 'package:crgtransp72app/pages/profil_vu.dart';
import 'package:flutter/material.dart';

import '../design/colors.dart';

import 'loginpage.dart';
import 'profil_ld.dart';
import 'profil_otkl.dart';
import 'profil_transport.dart';
import 'profile_izbrannoe.dart';

//import 'reguser2_page_.dart';

// Step 1.
String dropdownValue = 'Абатское';

class profil_name extends StatefulWidget {
  const profil_name({super.key});

  @override
  profil_nameForm createState() => profil_nameForm();

}

class profil_nameForm extends State<profil_name> {
  var _currentPage = 0;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/bgcolor_head_green_white.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox(
                height: 100.0,
                child: Image.asset(
                  'assets/images/fotouser.png', // путь к изображению
                  width: 100, // ширина изображения
                  height: 100, // высота изображения
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 5.0),
              child: const Text(
                'Иван Иванов',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child: Center(
                      
child: SwitchListTile(
        tileColor: whiteprColor,
        activeColor: GreenColor,
        title: const Text('Доступен для заказов'),
        value: isSwitched,
        onChanged: (bool? value) {
          setState(() {
            isSwitched = value!;
          });
        },
      )
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text('Транспорт'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => profil_transport()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text('Мои отклики'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => profil_otkl()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text('Личные данные'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>profil_ld()));
                } 
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text('Документы'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>profil_vu()));
                } 
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text('Избранное'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
                onPressed: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>profile_izbrannoe()));
                } 
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(top: 40.0),
              child: TextButton(
                child: const Text('Выйти из аккаунта'),
                style: TextButton.styleFrom(
                  foregroundColor: TexticonsColor,
                ),
      onPressed: () => _showExitConfirmationDialog(context),
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

class _showExitConfirmationDialog {
  _showExitConfirmationDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выход'),
          content: Text('Вы уверены, что хотите выйти?'),
          actions: <Widget>[
            TextButton(
              child: Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалоговое окно
              },
            ),
            TextButton(
              child: Text('Да'),
                onPressed: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>LoginPage()));
                } 
            ),
          ],
        );
      },
    );
  }
  
}
