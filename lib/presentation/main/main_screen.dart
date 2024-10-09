import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({required this.colors, super.key});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
    );
  }
}

class ColorConstants {
  static const List<Color> boardingGradientColors = <Color>[
    Color.fromARGB(255, 112, 51, 222),
    Color.fromARGB(255, 61, 33, 120),
  ];
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Horoscope for you'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          const Positioned.fill(
            child: BackgroundGradient(colors: ColorConstants.boardingGradientColors),
          ),
          Center( // Центрируем содержимое
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Выравнивание по вертикали
              children: <Widget>[
                Image.asset('assets/images/mainscreen.png', height: 200,), //  Добавьте  ваше  изображение  сюда,  указав  путь,  и  установите  необходимый  размер.
                const SizedBox(height: 20), //  Добавляем отступ между картинкой и текстом
                const Text(
                  'Астрологический прогноз',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.star, color: Color.fromARGB(255, 112, 51, 222)),
              onPressed: () {
                // Действие при нажатии на кнопку "Звезда"
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color:Color.fromARGB(255, 112, 51, 222)),
              onPressed: () {
                // Действие при нажатии на кнопку "Поиск"
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 112, 51, 222)),
              onPressed: () {
                // Действие при нажатии на кнопку "Календарь"
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Color.fromARGB(255, 112, 51, 222)),
              onPressed: () {
                // Действие при нажатии на кнопку "Профиль"
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color:Color.fromARGB(255, 112, 51, 222)),
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