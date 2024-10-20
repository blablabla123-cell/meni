import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/main/main_screen.dart';
import 'package:meni/presentation/user_info/widgets/date_picker.dart';
import 'package:meni/presentation/user_info/widgets/zodiac_picker.dart';

class UserDateOfBirthScreen extends StatefulWidget {
  const UserDateOfBirthScreen({super.key});

  @override
  State<UserDateOfBirthScreen> createState() => _UserDateOfBirthScreenState();
}

class _UserDateOfBirthScreenState extends State<UserDateOfBirthScreen> {
  DateTime _dateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ZodiacPicker(dateOfBirth: _dateOfBirth),
            const SizedBox(height: 20),
            Text("What's your date of bith?", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            DatePicker(onDateTimeChanged: (DateTime value) {
              setState(() => _dateOfBirth = value);
            }),
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
