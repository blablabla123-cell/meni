import 'package:flutter/material.dart';

import 'package:meni/presentation/boarding/boarding_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: BoardingScreen());
}