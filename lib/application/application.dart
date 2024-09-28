import 'package:flutter/material.dart';
import 'package:meni/application/utils/key_storage.dart';
import 'package:meni/business_logic/text_size_inherited_widget.dart';

import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/core/themes.dart';
import 'package:meni/application/utils/shared_repository.dart';

class Application extends StatelessWidget {
  const Application({required this.storage, super.key});
  final SharedRepository storage;

  @override
  Widget build(BuildContext context) {
    storage.write(KeyStorage.name, 'Merei');

    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const TextSizeInheritedWidget(size: 32.0, child: BoardingScreen()),
    );
  }
}
