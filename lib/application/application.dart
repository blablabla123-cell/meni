import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_interface.dart';
import 'package:meni/business_logic/text_size_inherited_widget.dart';
import 'package:meni/logger.dart';

import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/core/themes.dart';
import 'package:meni/application/utils/storage_repository.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final StorageRepository storage = StorageRepository();

    final Logger logger = Logger();

    storage.getFile();

    storage.write('Meni');
    final value = storage.read();

    logger.log(value.toString());

    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const TextSizeInheritedWidget(size: 32.0, child: BoardingScreen()),
    );
  }
}
