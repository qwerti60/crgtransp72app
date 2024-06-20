import 'package:flutter/material.dart';

class StartPages extends StatelessWidget{
  const StartPages({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Image.asset(
              'assets/images/logo.png',  // путь к изображению
              width: 189,  // ширина изображения
              height: 119,  // высота изображения
            ),
          ),    
          
      );
  }
}