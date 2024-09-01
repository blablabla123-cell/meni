import 'package:flutter/material.dart';
import 'package:meni/logger.dart';
import 'package:meni/presentation/widgets/background_image.dart';

@immutable
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  _BoardingScreenState();

  final Logger logger = Logger();
  String name = 'Meirzhan';

  @override
  Widget build(BuildContext context) {
    logger.log('Build');

    return Column(
      children: <Widget>[
        Text('Welcome! $name'),
        TextButton(
          onPressed: () => setState(() => name = 'Vadim'),
          child: const Text('Skip'),
        ),
        BackgroundImage(name),
      ],
    );
  }
}

