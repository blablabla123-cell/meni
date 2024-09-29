import 'package:flutter/material.dart';

class CoreElevatedButton extends StatelessWidget {
  const CoreElevatedButton({required this.title, required this.onPressed, super.key});
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
