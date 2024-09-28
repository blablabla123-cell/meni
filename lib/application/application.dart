import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/business_logic/text_size_inherited_widget.dart';

import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/core/themes.dart';

class Application extends StatelessWidget {
  const Application({required this.storage, super.key});
  final StorageRepository storage;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: TextSizeInheritedWidget(size: 32.0, child: BoardingScreen(storage: storage)),
    );
  }
}
