import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({required this.right, super.key});

  final void Function() right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: right,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}