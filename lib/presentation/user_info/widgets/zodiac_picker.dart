import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';
import 'package:meni/presentation/user_info/data/zodiac_signs_data.dart';
import 'package:meni/presentation/user_info/widgets/zodiac_item.dart';

class ZodiacPicker extends StatefulWidget {
  const ZodiacPicker({super.key});

  @override
  State<ZodiacPicker> createState() => _ZodiacPickerState();
}

class _ZodiacPickerState extends State<ZodiacPicker> {
  final List<ZodiacSign> data = ZodiacSignsData.data;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String start = Constants.zodiacDateFormat.format(data[selectedIndex].range.start);
    final String end = Constants.zodiacDateFormat.format(data[selectedIndex].range.end);

    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
            itemCount: data.length,
            itemBuilder: (_, int index) {
              selectedIndex = index;
              return ZodiacItem(zodiac: data[index]);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 12),
        Text(data.first.name, style: Theme.of(context).textTheme.bodyLarge),
        Text('$start - $end'),
        const SizedBox(height: 12),
      ],
    );
  }
}
