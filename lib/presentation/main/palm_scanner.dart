import 'package:flutter/material.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/main/main_screen.dart';

class PalmScanner extends StatelessWidget {
  const PalmScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Используем Stack для наложения элементов
      children: <Widget>[
        Center(
          // Центрируем содержимое по горизонтали
          child: Column(
            // Выравниваем элементы по вертикали
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                // Текст "Сфотографируйте свою ладонь"
                'Take a photo of your palm',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16), // Отступ
              const Text(
                // Инструкции для пользователя
                'Position the camera above your hand so that the\nlines on your palm are clearly visible.\nPay attention to the lighting.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 32), // Отступ
              SizedBox(
                // SizedBox для ограничения размера изображения и CustomPaint
                height: 250,
                width: 250,
                child: Stack(
                  // Stack для наложения изображения руки и круга
                  alignment: Alignment.center,
                  children: <Widget>[
                    //Image.asset('assets/images/mainscreen.png', fit: BoxFit.contain), // Изображение руки (замените на свой путь)
                    CustomPaint(
                      // Рисуем круг со знаками зодиака
                      size: const Size(250, 250),
                      painter: ZodiacCirclePainter(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32), // Отступ
              CoreElevatedButton(
                // Кнопка "Перейти к камере"
                title: 'Go to camera',
                onPressed: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute<LoadingScreen>(
                  //     builder: (_) => const LoadingScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
