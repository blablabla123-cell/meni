import 'package:flutter/material.dart';

abstract class ApplicationConstants {
  static const String _imagesFolder = 'images/';
  static const String backgroundImageUrl = '${_imagesFolder}boarding_bg_image.jpg';

  static const List<Color> boardingGradientColors = [
    Color(0xff1f005c),
    Color(0xff5b0060),
    Color(0xff870160),
    Color(0xffac255e),
    Color(0xffca485c),
    Color(0xffe16b5c),
    Color(0xfff39060),
    Color(0xffffb56b),
  ];
}
