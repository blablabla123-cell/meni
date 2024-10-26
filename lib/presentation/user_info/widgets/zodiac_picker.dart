import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';
import 'package:meni/presentation/user_info/data/zodiac_signs_data.dart';
import 'package:meni/presentation/user_info/widgets/zodiac_sign_icons_list.dart';

class ZodiacPicker extends StatefulWidget {
  const ZodiacPicker({required this.dateOfBirth, super.key});
  final DateTime dateOfBirth;

  @override
  State<ZodiacPicker> createState() => _ZodiacPickerState();
}

class _ZodiacPickerState extends State<ZodiacPicker> {
  final List<ZodiacSign> data = ZodiacSignsData.data;
  int selectedIndex = 0;

  @override
  void didUpdateWidget(covariant ZodiacPicker oldWidget) {
    selectedIndex = getSelectedIndex(data, widget.dateOfBirth);
    super.didUpdateWidget(oldWidget);
  }

  // init state
  // did update widget
  // build
  // dispose

  @override
  Widget build(BuildContext context) {
    final String start = Constants.zodiacDateFormat.format(data[selectedIndex].range.start);
    final String end = Constants.zodiacDateFormat.format(data[selectedIndex].range.end);

    return Column(
      children: <Widget>[
        Zodiacs(zodiacs: data, selectedIndex: selectedIndex),
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
