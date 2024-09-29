import 'package:flutter/material.dart';
import 'package:meni/business_logic/text_size_inherited_widget.dart';
import 'package:meni/main_screen/loading_screen/loading_screen.dart';
import 'package:meni/core/themes.dart';
import 'package:meni/main_screen/main_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const TextSizeInheritedWidget(size: 32.0, child: MainScreen('Приветики Вадим)')),
    );
  }
}
