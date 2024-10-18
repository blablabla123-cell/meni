import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/core/widgets/background_gradient.dart';
import 'package:meni/core/themes.dart';

// Класс для хранения данных градиента
class ColorConstants {
  static const List<Color> boardingGradientColors = <Color>[
    CoreColors.darkGrey
   
  ];
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 3; // Индекс выбранного элемента в BottomNavigationBar

  void _onItemTapped(int index) {
    // Функция, вызываемая при нажатии на элемент BottomNavigationBar
    setState(() {
      _selectedIndex = index; // Обновляем индекс выбранного элемента
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Расширяем body под AppBar и BottomNavigationBar
      extendBodyBehindAppBar: true, // AppBar становится прозрачным
      appBar: AppBar(
        title: const Text('Palm scanner'), // Заголовок AppBar
        backgroundColor: Colors.transparent, // Прозрачный фон AppBar
        elevation: 0, // Убираем тень AppBar
      ),
      body: Stack( // Используем Stack для наложения элементов
        children: <Widget>[
          const Positioned.fill( // Градиент на весь экран
            child: BackgroundGradient(colors: ColorConstants.boardingGradientColors),
          ),
          Center( // Центрируем содержимое по горизонтали
            child: Column( // Выравниваем элементы по вертикали
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text( // Текст "Сфотографируйте свою ладонь"
                  'Take a photo of your palm',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16), // Отступ
                const Text( // Инструкции для пользователя
                  'Position the camera above your hand so that the\nlines on your palm are clearly visible.\nPay attention to the lighting.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 32), // Отступ
                SizedBox( // SizedBox для ограничения размера изображения и CustomPaint
                  height: 250,
                  width: 250,
                  child: Stack( // Stack для наложения изображения руки и круга
                    alignment: Alignment.center,
                    children: <Widget>[
                      //Image.asset('assets/images/mainscreen.png', fit: BoxFit.contain), // Изображение руки (замените на свой путь)
                      CustomPaint( // Рисуем круг со знаками зодиака
                        size: const Size(250, 250),
                        painter: ZodiacCirclePainter(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32), // Отступ
                CoreElevatedButton( // Кнопка "Перейти к камере"
                  title: 'Go to camera',
                  onPressed: () {
                    // Здесь добавьте логику для открытия камеры
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( // Нижняя панель навигации
        items: const <BottomNavigationBarItem>[ // Элементы навигации
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_fish_eye),
            label: 'Horoscope',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Compatibility',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.casino_outlined),
            label: 'Tarot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.back_hand_outlined),
            label: 'Palm scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        backgroundColor:CoreColors.darkGrey,
        currentIndex: _selectedIndex, // Индекс текущего выбранного элемента
        selectedItemColor: CoreColors.purple, // Цвет выбранного элемента
        unselectedItemColor: const Color.fromARGB(255, 121, 119, 119), // Цвет невыбранных элементов
        onTap: _onItemTapped, // Функция, вызываемая при нажатии
         type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ZodiacCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Логика рисования круга и знаков зодиака
    final Offset center = Offset(size.width / 2, size.height / 2); // Центр круга
    final double radius = size.width / 2 * 0.8; // Радиус круга

    final Paint paint = Paint() // Кисть для рисования круга
      ..color = Colors.black.withOpacity(0.5) // Цвет круга
      ..style = PaintingStyle.stroke // Стиль рисования (обводка)
      ..strokeWidth = 20; // Толщина обводки

    canvas.drawCircle(center, radius, paint); // Рисуем круг

    // Здесь нужно добавить логику для рисования знаков зодиака
    // вокруг круга.  Рекомендуется использовать изображения или иконки.
    // Пример с текстом (замените на изображения/иконки):
    const List<String> zodiacSymbols = [
      '♈', '♉', '♊', '♋', '♌', '♍', '♎', '♏', '♐', '♑', '♒', '♓'
    ];

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < zodiacSymbols.length; i++) {
      final double angle = -i * 30 * math.pi / 180; // Вычисляем угол для каждого знака
      final double x = center.dx + radius * math.cos(angle) - 10; // Координата x знака
      final double y = center.dy + radius * math.sin(angle) - 10; // Координата y знака

      textPainter.text = TextSpan(
        text: zodiacSymbols[i],
        style: const TextStyle(
          color: Color(0xFF20C27A),
          fontSize: 20,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x, y)); // Рисуем знак
    }

  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false; // Перерисовываем только при изменении параметров
}