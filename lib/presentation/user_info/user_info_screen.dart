import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/core/constants.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({required this.fileStorage, super.key});
  final StorageRepository fileStorage;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  DateTime? _birthDate;
  String _name = '';

  @override
  Widget build(BuildContext context) {
    print(widget.fileStorage.read());
    return Scaffold(
      appBar: AppBar(title: const Text('Привет!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Введите ваше имя:'),
            TextField(onChanged: (String text) => setState(() => _name = text)),
            const SizedBox(height: 20),
            const Text('Укажите дату рождения:'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _pickDate,
              child: const Text('Выбрать дату'),
            ),
            const SizedBox(height: 20),
            if (_name.isNotEmpty) Text('Имя: $_name'), // Отображение имени моментально
            if (_birthDate != null) Text('Дата рождения: ${Constants.dateFormat.format(_birthDate!)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.fileStorage.write('name=$_name;birth_date=$_birthDate');
                if (_name.isNotEmpty && _birthDate != null) {
                  // TODO: Validation
                  // Name is less than 3 symbols --> error
                  // List of signs
                  // birth date > 12 years
                  // await or then to make synschroures code completion
                  // write (create keys key repository)
                  // Navigator push replacement Main Screen
                }
              },
              child: const Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }

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
}
