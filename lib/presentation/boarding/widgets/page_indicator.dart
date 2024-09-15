import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({required this.left, required this.right, super.key});

  final void Function() left;
  final void Function() right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: left,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        IconButton(
          onPressed: right,
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ],
    );
  }
}
