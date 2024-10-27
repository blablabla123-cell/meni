import 'package:flutter/material.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

class Zodiacs extends StatefulWidget {
  const Zodiacs({
    required this.zodiacs,
    required this.selectedIndex,
    super.key,
  });

  final List<ZodiacSign> zodiacs;
  final int selectedIndex;

  @override
  State<Zodiacs> createState() => _ZodiacsState();
}

class _ZodiacsState extends State<Zodiacs> {
  late List<ZodiacSign> _localZodiacs;

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
    // New data
    _localZodiacs = List<ZodiacSign>.from(widget.zodiacs);

    final ZodiacSign selectedZodiacSign = _localZodiacs[widget.selectedIndex];

    _localZodiacs.removeAt(widget.selectedIndex);

    _localZodiacs.shuffle();

    _localZodiacs.insert(2, selectedZodiacSign);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        5,
        (int index) => Text(
          _localZodiacs[index].icon,
          style: TextStyle(fontSize: index == 2 ? 64 : 48),
        ),
      ),
    );
  }
}
