import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';

abstract class Themes {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(

        /// TEXT STYLES
        titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
        labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
        foregroundColor: const WidgetStatePropertyAll<Color?>(Colors.white),
        backgroundBuilder: (BuildContext context, Set<WidgetState> states, Widget? child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  CoreColors.purpleGradientLight,
                  CoreColors.purpleGradientDark,
                ],
              ),
            ),
            child: child,
          );
        },
      ),
    ),
  );
}
