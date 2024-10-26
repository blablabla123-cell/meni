import 'package:flutter/material.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

abstract class ZodiacSignsData {
  static List<ZodiacSign> data = <ZodiacSign>[
    ZodiacSign(
      name: 'Aries',
      range: DateTimeRange(start: DateTime(0, 3, 21), end: DateTime(0, 4, 19)),
      icon: '♈',
    ),
    ZodiacSign(
      name: 'Taurus',
      range: DateTimeRange(start: DateTime(0, 4, 20), end: DateTime(0, 5, 20)),
      icon: '♉',
    ),
    ZodiacSign(
      name: 'Gemini',
      range: DateTimeRange(start: DateTime(0, 5, 21), end: DateTime(0, 6, 21)),
      icon: '♊',
    ),
    ZodiacSign(
      name: 'Cancer',
      range: DateTimeRange(start: DateTime(0, 6, 22), end: DateTime(0, 7, 22)),
      icon: '♈',
    ),
    ZodiacSign(
      name: 'Leo',
      range: DateTimeRange(start: DateTime(0, 7, 23), end: DateTime(0, 8, 22)),
      icon: '♈',
    ),
    ZodiacSign(
      name: 'Virgo',
      range: DateTimeRange(start: DateTime(0, 8, 23), end: DateTime(0, 9, 22)),
      icon: '♍',
    ),
    ZodiacSign(
      name: 'Libra',
      range: DateTimeRange(start: DateTime(0, 9, 23), end: DateTime(0, 10, 23)),
      icon: '♎',
    ),
    ZodiacSign(
      name: 'Sagittarius',
      range: DateTimeRange(start: DateTime(0, 11, 22), end: DateTime(0, 12, 21)),
      icon: '♐',
    ),
    ZodiacSign(
      name: 'Capricornus',
      range: DateTimeRange(start: DateTime(0, 12, 22), end: DateTime(0, 12, 31)),
      icon: '♑',
    ),
        ZodiacSign(
      name: 'Capricornus',
      range: DateTimeRange(start: DateTime(0), end: DateTime(0, 1, 20)),
      icon: '♑',
    ),
    ZodiacSign(
      name: 'Aquarius',
      range: DateTimeRange(start: DateTime(0, 1, 20), end: DateTime(0, 2, 18)),
      icon: '♒',
    ),
    ZodiacSign(
      name: 'Pisces',
      range: DateTimeRange(start: DateTime(0, 2, 19), end: DateTime(0, 3, 20)),
      icon: '♓',
    ),
  ];
}
