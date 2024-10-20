import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';
import 'package:meni/presentation/user_info/data/zodiac_signs_data.dart';
import 'package:meni/presentation/user_info/widgets/zodiac_item.dart';

class ZodiacPicker extends StatefulWidget {
  const ZodiacPicker({required this.dateOfBirth, super.key});
  final DateTime dateOfBirth;

  @override
  State<ZodiacPicker> createState() => _ZodiacPickerState();
}

class _ZodiacPickerState extends State<ZodiacPicker> {
  final List<ZodiacSign> data = ZodiacSignsData.data;
  final ScrollController controller = ScrollController();
  int selectedIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = getSelectedIndex(data, widget.dateOfBirth);
    print(selectedIndex);

    final String start = Constants.zodiacDateFormat.format(data[selectedIndex].range.start);
    final String end = Constants.zodiacDateFormat.format(data[selectedIndex].range.end);

    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: ListView.separated(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
            itemCount: data.length,
            itemBuilder: (_, int index) {
              return ZodiacItem(zodiac: data[index]);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 12),
        Text(data[selectedIndex].name, style: Theme.of(context).textTheme.bodyLarge),
        Text('$start - $end'),
        const SizedBox(height: 12),
      ],
    );
  }
}

// Which one

// How

// 1 2 3 4 5 6 7 8 9 10
// 4 - 6
// 5

int getSelectedIndex(List<ZodiacSign> data, DateTime dateOfBirth) {
  final int year = dateOfBirth.year;
  for (ZodiacSign zodiac in data) {
    final DateTime start = DateTime(year, zodiac.range.start.month, zodiac.range.start.day);
    final DateTime end = DateTime(year, zodiac.range.end.month, zodiac.range.end.day);

    bool isAfter = false;
    bool isBefore = false;

    isAfter = dateOfBirth.compareTo(start) >= 0;
    isBefore = dateOfBirth.compareTo(end) <= 0;

    if (isAfter && isBefore) {
      return data.indexOf(zodiac);
    } else {
      continue;
    }
  }

  return 0;
}
