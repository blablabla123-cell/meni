import 'package:flutter/material.dart';
import 'dart:math';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

class Zodiacs extends StatefulWidget {
  const Zodiacs({required this.zodiacs, required this.selectedIndex, super.key});

  final List<ZodiacSign> zodiacs;
  final int selectedIndex;

  @override
  State<Zodiacs> createState() => _ZodiacsState();
}

class _ZodiacsState extends State<Zodiacs> {
  late List<ZodiacSign> localZodiacs;

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  void didUpdateWidget(covariant Zodiacs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _update();
    }
  }

  void _update() {
    // Create a new list excluding the selected zodiac sign
    localZodiacs = List<ZodiacSign>.from(widget.zodiacs);

    final ZodiacSign selected = localZodiacs[widget.selectedIndex];

    localZodiacs.removeAt(widget.selectedIndex);

    localZodiacs.shuffle();

    localZodiacs.insert(2, selected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        5,
        (int index) => Text(
          localZodiacs[index].icon,
          style: TextStyle(fontSize: index == 2 ? 64 : 48),
        ),
      ),
    );
  }
}
