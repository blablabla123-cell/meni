import 'package:flutter/material.dart';
import 'package:meni/core/core_colors.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/boarding/data/models/boarding_data.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({
    required this.data,
    required this.controller,
    required this.pageIndex,
    required this.totalPages,
    required this.onPressed,
    super.key,
  });

  final BoardingData data;
  final PageController controller;
  final int pageIndex;
  final int totalPages;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(data.subtitle, textAlign: TextAlign.center),
          const SizedBox(height: 64),
          Text(
            '${data.progressValue}%',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: data.progressValue / 100,
            backgroundColor: CoreColors.darkGrey,
            valueColor: const AlwaysStoppedAnimation<Color>(CoreColors.purple),
            minHeight: 6,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          const SizedBox(height: 32),
          Row(
            children: <Widget>[
              Expanded(child: CoreElevatedButton(title: 'Continue', onPressed: onPressed)),
            ],
          ),
        ],
      ),
    );
  }
}
