import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';
import 'package:meni/core/core_typography.dart';

abstract class Themes {
  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
        foregroundColor: const WidgetStatePropertyAll<Color?>(CoreColors.elevatedButtonForeground),
        textStyle: const WidgetStatePropertyAll<TextStyle>(CoreTypography.buttonTextStyle),
        backgroundBuilder: (BuildContext context, Set<WidgetState> states, Widget? child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
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
