import 'package:flutter/material.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';

class Zodiacs extends StatefulWidget {
  const Zodiacs({required this.zodiacs, required this.selectedIndex, super.key});

  final List<ZodiacSign> zodiacs;
  final int selectedIndex;

  @override
  State<Zodiacs> createState() => _ZodiacsState();
}

class _ZodiacsState extends State<Zodiacs> {
  final ScrollController controller = ScrollController();

  @override
  void didUpdateWidget(covariant Zodiacs oldWidget) {
   
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final bool isSelected = widget.selectedIndex == index;

          return Text(
            widget.zodiacs[index].icon,
            style: TextStyle(fontSize: isSelected ? 64 : 32),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
        itemCount: widget.zodiacs.length,
      ),
    );
  }
}
