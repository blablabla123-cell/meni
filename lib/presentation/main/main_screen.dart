import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:meni/application/utils/network_repository.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/loading/loading_screen.dart';
import 'package:meni/presentation/main/horoscope_nav_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NetworkRepository network = NetworkRepository();
  int _selectedIndex = 3; // Индекс выбранного элемента в BottomNavigationBar

  void _onItemTapped(int index) {
    // Функция, вызываемая при нажатии на элемент BottomNavigationBar
    if (index == 0) {
      _showHoroscopeDialog();
    } else {
      setState(() {
        _selectedIndex = index; // Обновляем индекс выбранного элемента
      });
    }
  }

  // Обработчик нажатия на знак зодиака
  void _onZodiacSelected(String zodiac) {
    Navigator.pop(context); // Закрыть всплывающее окно
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Вы выбрали знак зодиака: $zodiac')),
    );
  }

  // Открытие всплывающего окна со всеми знаками зодиака
  void _showHoroscopeDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[850], // Фон всплывающего окна
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Horoscope',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200, // Уменьшена высота, чтобы отобразить все знаки
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Увеличено количество колонок для всех знаков
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 12, // Количество знаков зодиака
                  itemBuilder: (BuildContext context, int index) {
                    const List<String> zodiacSymbols = <String>[
                      '♈',
                      '♉',
                      '♊',
                      '♋',
                      '♌',
                      '♍',
                      '♎',
                      '♏',
                      '♐',
                      '♑',
                      '♒',
                      '♓'
                    ];
                    const List<String> zodiacNames = <String>[
                      'Овен',
                      'Телец',
                      'Близнецы',
                      'Рак',
                      'Лев',
                      'Дева',
                      'Весы',
                      'Скорпион',
                      'Стрелец',
                      'Козерог',
                      'Водолей',
                      'Рыбы'
                    ];
                    return GestureDetector(
                      onTap: () => _onZodiacSelected(zodiacNames[index]), // Обработка нажатия на знак
                      child: Card(
                        color: Colors.grey[800], // Цвет карточек
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                zodiacSymbols[index], // Знак зодиака
                                style: const TextStyle(fontSize: 24, color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                zodiacNames[index], // Название знака зодиака
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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
      body: HoroscopeNavBarItem(network: network),
      bottomNavigationBar: BottomNavigationBar(
        // Нижняя панель навигации
        items: const <BottomNavigationBarItem>[
          // Элементы навигации
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
        currentIndex: _selectedIndex, // Индекс текущего выбранного элемента
        onTap: _onItemTapped, // Функция, вызываемая при нажатии
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
    // вокруг круга. Рекомендуется использовать изображения или иконки.
    const List<String> zodiacSymbols = <String>['♈', '♉', '♊', '♋', '♌', '♍', '♎', '♏', '♐', '♑', '♒', '♓'];

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
