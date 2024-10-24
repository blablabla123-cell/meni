import 'package:flutter/material.dart';
import 'package:meni/application/utils/key_storage.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/core/themes.dart';
import 'package:meni/presentation/boarding/boarding_screen.dart';
import 'package:meni/presentation/user_info/user_date_of_birth_screen.dart';
import 'package:meni/presentation/user_info/user_name_screen.dart';

class Application extends StatefulWidget {
  const Application({required this.storage, super.key});
  final StorageRepository storage;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isBoarding = false;
  bool isDateOfBirth = false;

  @override
  void initState() {
    isBoarding = widget.storage.read()?.contains('boarding=true') ?? false;
    isDateOfBirth = widget.storage.read()?.contains(KeyStorage.name) ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      // Ternary operator
      home: isBoarding
          ? isDateOfBirth
              ? const UserDateOfBirthScreen()
              : UserNameScreen(storage: widget.storage)
          : BoardingScreen(storage: widget.storage),
    );
  }
}
