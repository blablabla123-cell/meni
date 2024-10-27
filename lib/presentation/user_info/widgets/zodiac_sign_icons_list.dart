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
    // Picked Zodiac
    final ZodiacSign selectedZodiac = widget.zodiacs[widget.selectedIndex];

    // New List
    localZodiacs = List<ZodiacSign>.from(widget.zodiacs);

    // If noy any picked
    if (widget.zodiacs[widget.selectedIndex] != widget.zodiacs[8] &&
        widget.zodiacs[widget.selectedIndex] != widget.zodiacs[9]) {
      localZodiacs.remove(widget.zodiacs[8]);
    } 
    
    if(widget.zodiacs[widget.selectedIndex] == widget.zodiacs[8]) {
       localZodiacs.remove(widget.zodiacs[9]);
    }

    if(widget.zodiacs[widget.selectedIndex] == widget.zodiacs[9]) {
       localZodiacs.remove(widget.zodiacs[8]);
    }

    final int updatedIndex = localZodiacs.indexOf(selectedZodiac);

    localZodiacs = <ZodiacSign>[
      localZodiacs[(updatedIndex - 2 + localZodiacs.length) % localZodiacs.length], // 10
      localZodiacs[(updatedIndex - 1 + localZodiacs.length) % localZodiacs.length], // 11
      localZodiacs[updatedIndex], // 0
      localZodiacs[(updatedIndex + 1) % localZodiacs.length], // 1
      localZodiacs[(updatedIndex + 2) % localZodiacs.length], // 2
    ];
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
