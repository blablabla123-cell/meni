import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Loading', // Первая надпись
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Building your natal chart', // Вторая надпись
         style: Theme.of(context).textTheme.bodyMedium,
        ),
    SizedBox(
      width: 420,
      height: 420,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Outer glowing circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: <Color>[
                        CoreColors.purple.withOpacity(1),
                        Colors.transparent,
                      ],
                      stops: const <double>[0.5, 1.0],
                    ),
                  ),
                ),
                // Zodiac symbols
                // ignore: always_specify_types
                ...List.generate(12, (int index) {
                  double angle = (index * 30) * pi / 180;
                  return Transform(
                    transform: Matrix4.identity()
                      ..translate(130 * cos(angle), 130 * sin(angle)),
                    child: Text(
                      getZodiacSymbol(index),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  );
                }),
                // Inner design
                Positioned.fill(
                  child: CustomPaint(
                    painter: InnerDesignPainter(),
              ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String getZodiacSymbol(int index) {
    const List<String> symbols = <String>[
      ' ♈︎', '♉︎', '♊︎', '♋︎', '♌︎', '♍︎',
      '♎︎', '♏︎', '♐︎', '♑︎', '♒︎', '♓︎'
    ];
    return symbols[index];
  }
}

class InnerDesignPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 4;

    // Draw inner circle
    canvas.drawCircle(center, radius, paint);

    // Draw star design
    final Path starPath = Path();
    for (int i = 0; i < 6; i++) {
      double angle = (i * 60) * pi / 180;
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);
      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();
    canvas.drawPath(starPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}