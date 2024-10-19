import 'package:flutter/material.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

class ZodiacItem extends StatelessWidget {
  const ZodiacItem({required this.zodiac, super.key});
  final ZodiacSign zodiac;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          zodiac.icon,
          style: const TextStyle(fontSize: 60),
        ),
      ],
    );
  }
}
