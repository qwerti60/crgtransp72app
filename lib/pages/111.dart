import 'package:flutter/material.dart';

class MyWidgetbtn extends StatelessWidget {
  // Допустим, это ваш Future, который возвращает DateTime
  Future<DateTime> getDate() async {
    return DateTime.now()
        .add(Duration(days: 31)); // Примерное значение, измените на ваше
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateTime>(
      future: getDate(), // Вызов вашего Future
      builder: (context, snapshot) {
        // Проверка на наличие данных
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          // Расчет разницы в днях между текущим моментом и датой из snapshot
          final differenceInDays =
              DateTime.now().difference(snapshot.data!).inDays;

          // Проверка условия для активности кнопки
          final bool isButtonEnabled = differenceInDays <= 30;

          return Center(
            child: ElevatedButton(
              style: ButtonStyle(
                // Установка цвета кнопки в зависимости от ее активности
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  // Здесь можно добавить другие состояния, например disabled
                  if (!isButtonEnabled) return Colors.grey;
                  return Colors
                      .blue; // Использование синего для активной кнопки
                }),
              ),
              onPressed: isButtonEnabled
                  ? () {
                      // Обработка нажатия
                      print('Button pressed');
                    }
                  : null, // Делаем кнопку неактивной
              child: Text('Тестовая кнопка'),
            ),
          );
        } else {
          // Выводим индикатор загрузки, пока ждем данные
          return CircularProgressIndicator();
        }
      },
    );
  }
}
