import 'package:flutter/material.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

class Zodiacs extends StatelessWidget {
  const Zodiacs({required this.zodiacs, required this.selectedIndex, super.key});

  final List<ZodiacSign> zodiacs;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // [1, 2, 3, 4, 5]
        ...List<Text>.generate(2, (int index) {
          return Text(_getRandom().icon, style: const TextStyle(fontSize: 48));
        }),
        Text(
          zodiacs[selectedIndex].icon,
          style: const TextStyle(fontSize: 72),
        ),
        ...List<Text>.generate(2, (int index) {
          return Text(_getRandom().icon, style: const TextStyle(fontSize: 48));
        }),
      ],
    );
  }

  ZodiacSign _getRandom() {
    zodiacs.shuffle();

    return zodiacs.first == zodiacs[selectedIndex] ? zodiacs.last : zodiacs.first;
  }
}
