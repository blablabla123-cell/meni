import 'package:flutter/material.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/main/main_screen.dart';

class UserBirthdayScreen extends StatefulWidget {
  const UserBirthdayScreen({super.key});

  @override
  State<UserBirthdayScreen> createState() => _UserBirthdayScreenState();
}

class _UserBirthdayScreenState extends State<UserBirthdayScreen> {
  DateTime? _birthDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => _birthDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Укажите дату рождения:'),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _pickDate,
          child: const Text('Выбрать дату'),
        ),
        if (_birthDate != null) Text('Дата рождения: ${Constants.dateFormat.format(_birthDate!)}'),
        const SizedBox(height: 20),
        Row( 
          children: [
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
    );
  }
}