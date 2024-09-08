import 'package:flutter/material.dart';

import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/core/application_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ApplicationTheme.applicationTheme, home: const BoardingScreen());
  }
}
