import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Расширяем body под AppBar и BottomNavigationBar
      extendBodyBehindAppBar: true, // AppBar становится прозрачным
      appBar: AppBar(
        title: const Text('Horoscope for you'),
        backgroundColor: Colors.transparent, // AppBar прозрачный
        elevation: 0, // Убираем тень AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: ColorConstants.boardingGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Астрологический прогноз: У Водолеев всегда все ЗАЕБИСЬ!!!',
                style: TextStyle(fontSize: 20, color: Colors.white), // Добавляем белый цвет текста
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                // Действие при нажатии на кнопку "Звезда"
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Действие при нажатии на кнопку "Поиск"
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                // Действие при нажатии на кнопку "Календарь"
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Действие при нажатии на кнопку "Профиль"
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Действие при нажатии на кнопку "Настройки"
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ColorConstants {
  static const List<Color> boardingGradientColors = <Color>[
    Colors.blue,
    Colors.green,
  ];
}