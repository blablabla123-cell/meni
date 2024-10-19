import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/main/main_screen.dart';
import 'package:meni/presentation/user_info/data/models/zodiac_sign.dart';
import 'package:meni/presentation/user_info/data/zodiac_signs_data.dart';
import 'package:meni/presentation/user_info/widgets/date_picker.dart';
import 'package:meni/presentation/user_info/widgets/zodiac_picker.dart';

class UserDateOfBirthScreen extends StatefulWidget {
  const UserDateOfBirthScreen({super.key});

  @override
  State<UserDateOfBirthScreen> createState() => _UserDateOfBirthScreenState();
}

class _UserDateOfBirthScreenState extends State<UserDateOfBirthScreen> {
  DateTime? _birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           const ZodiacPicker(),
            const SizedBox(height: 20),
            Text("What's your date of bith?", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            const DatePicker(),
            if (_birthDate != null) Text('Дата рождения: ${Constants.dateFormat.format(_birthDate!)}'),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: CoreElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<MainScreen>(
                          builder: (_) => const MainScreen(),
                        ),
                      );
                    },
                    title: 'Continue',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
