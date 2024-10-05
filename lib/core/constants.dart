import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class Constants {
  static const String _imagesFolder = 'assets/images/';
  // static const String _iconsFolder = 'icons/';

  // IMAGES
  static const String backgroundImage1 = '${_imagesFolder}boarding_bg_1.jpg';
  static const String backgroundImage2 = '${_imagesFolder}boarding_bg_2.jpg';
  static const String backgroundImage3 = '${_imagesFolder}boarding_bg_3.jpg';


  // ICONS
  // static const String addIcon = '${_iconsFolder}';

  static const List<Color> boardingGradientColors = <Color>[
    Color(0xff1f005c),
    Color(0xff5b0060),
    Color(0xff870160),
    Color(0xffac255e),
    Color(0xffca485c),
    Color(0xffe16b5c),
    Color(0xfff39060),
    Color(0xffffb56b),
  ];

  // DATE FORMAT
  static final DateFormat dateFormat = DateFormat.yMMMd();
}
