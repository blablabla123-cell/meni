import 'package:flutter/material.dart';

abstract class Constants {
  static const String _imagesFolder = 'images/';
  static const String _iconsFolder = 'icons/';

  // IMAGES
  static const String backgroundImage1 = '${_imagesFolder}588762f1e516bd85eaf3a52c09e93e01.jpg';
  static const String backgroundImage2 = '${_imagesFolder}boarding_bg_image.jpg';
  static const String backgroundImage3 = '${_imagesFolder}f01169672a969cd912811e554976e54b.jpg';


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
}
