import 'package:flutter/material.dart';
import 'package:meni/application/utils/key_storage.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/core/themes.dart';
import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/presentation/main/main_screen.dart';
import 'package:meni/presentation/user_info/user_date_of_birth_screen.dart';
import 'package:meni/presentation/user_info/user_name_screen.dart';

class Application extends StatefulWidget {
  const Application({required this.storage, super.key});
  final StorageRepository storage;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isUserBoarding = false;
  bool isUserDateOfBirth = false;
  bool isUserName = false;
  Widget? home;

  @override
  void initState() {
    isUserBoarding = widget.storage.read()?.contains(KeyStorage.userBoarding) ?? false;
    isUserName = widget.storage.read()?.contains(KeyStorage.name) ?? false;
    isUserDateOfBirth = widget.storage.read()?.contains(KeyStorage.userDateOfBirth) ?? false;

    if (!isUserBoarding) {
      home = BoardingScreen(storage: widget.storage);
    }

    if (isUserName && isUserDateOfBirth && isUserBoarding) {
      home = const MainScreen();
    }

    if (isUserName && !isUserDateOfBirth) {
      home = UserDateOfBirthScreen(storage: widget.storage);
    }

    if (!isUserName && !isUserDateOfBirth && isUserBoarding) {
      home = UserNameScreen(storage: widget.storage);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      // Ternary operator
      home: home,
    );
  }
}
