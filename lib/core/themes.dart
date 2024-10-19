import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';

abstract class Themes {
  static ThemeData darkTheme = ThemeData(
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
      dateTimePickerTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
    )),

    /// BG COLOR
    scaffoldBackgroundColor: CoreColors.darkGrey,

    /// FONT
    fontFamily: 'Poppins',

    /// TEXT STYLES
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
      labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
    ),

    /// ELEVATED BUTTON STYLE
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

    /// BOTTOM NAV BAR STYLE
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: CoreColors.purple,
      unselectedItemColor: CoreColors.lightGrey,
      backgroundColor: CoreColors.darkGrey,
      type: BottomNavigationBarType.fixed,
    ),

    /// TEXTFIELD STYLES
    inputDecorationTheme: const InputDecorationTheme(
      /// TODO: Hint style change
      hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: CoreColors.purple),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: CoreColors.error),
      ),
    ),
  );
}
