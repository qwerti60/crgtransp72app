import 'package:flutter/material.dart';

import '../design/colors.dart';

class MyVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0), // Высота двух строк
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: Column(
            children: [
// Первая строка
              Padding(
padding: const EdgeInsets.symmetric(vertical:  40.0),
                child: Container(
                  height: 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Поиск',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.0), 
// Вторая строка
              Padding(
padding: const EdgeInsets.symmetric(vertical:  5.0),
                child: Row(
 //.                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      body: Center(
        child: Text("Ваше основное содержимое здесь"),
      ),
    );
  }
}
