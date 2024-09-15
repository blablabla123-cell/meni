import 'package:flutter/material.dart';

class TextSizeInheritedWidget extends InheritedWidget {
  const TextSizeInheritedWidget({required super.child, required this.size, super.key});

  final double size;

  static TextSizeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TextSizeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
