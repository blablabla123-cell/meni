import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String text;

  const MainScreen(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const BackgroundGradient(colors: Constants.boardingGradientColors),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.account_circle),
              Text(text),
              IconButton(
                icon: const Icon(Icons.favorite),
                iconSize: 32.0,
                color: Colors.red,
                onPressed: () {
                  // Do something when the button is pressed.
                },
                tooltip: 'Add to favorites',
                splashColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundGradient extends StatelessWidget {
  final List<Color> colors;

  const BackgroundGradient({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class Constants {
  static const List<Color> boardingGradientColors = <Color>[Colors.blue, Colors.green];
}