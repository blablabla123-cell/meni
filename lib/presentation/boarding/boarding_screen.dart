import 'package:flutter/material.dart';
import 'package:meni/logger.dart';
import 'package:meni/presentation/widgets/background_image.dart';
import 'package:meni/core/application_constants.dart';

@immutable
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  _BoardingScreenState();
  String name = 'Meirzhan';

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        const BackgroundGradient(imageUrl: ApplicationConstants.backgroundImageUrl),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: const Text('Welcome')),
          body: Column(
            children: <Widget>[
              Text(
                'Welcome $name',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () => setState(() => name = 'Vadim'),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
