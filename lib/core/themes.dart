import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';

abstract class Themes {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
        foregroundColor: const WidgetStatePropertyAll<Color?>(CoreColors.elevatedButtonForeground),
        backgroundBuilder: (BuildContext context, Set<WidgetState> states, Widget? child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CoreColors.elevatedButtonBackground1,
                  CoreColors.elevatedButtonBackground2,
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
