import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/presentation/main/main_screen.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/user_info/user_birthday_screen.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({required this.storage, super.key});
  final StorageRepository storage;

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  String _name = '';
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What\'s your name?',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'bears a certain cosmic imprint and is influenced by certain cosmic forces.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 128),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Enter name', errorText: _error),
                onChanged: (String text) {
                  setState(() {
                    _name = text;
                    _error = null;
                  });
                },
              ),
              const SizedBox(height: 64),
              Row(
                children: [
                  Expanded(
                    child: CoreElevatedButton(
                      onPressed: () {
                        if (_name.isEmpty) {
                          setState(() => _error = '');
                          return;
                        }

                        widget.storage.write('name', _name);

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<UserBirthdayScreen>(
                            builder: (_) => const UserBirthdayScreen(),
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
      ),
    );
  }
}
