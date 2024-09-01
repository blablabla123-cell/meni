import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Icon(Icons.account_circle),
      Text(text),
    ]);
  }
}
