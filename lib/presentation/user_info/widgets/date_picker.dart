import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CupertinoDatePicker(
        dateOrder: DatePickerDateOrder.dmy,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        selectionOverlayBuilder: (BuildContext context, {required int columnCount, required int selectedIndex}) {
          return null;
        },
        onDateTimeChanged: (DateTime value) {},
      ),
    );
  }
}
