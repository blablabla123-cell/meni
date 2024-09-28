import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserInfoScreen(),
  ));
}

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _birthDate;

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text("Привет!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Введите ваше имя:'),
            TextField(
              controller: _nameController,
              onChanged: (text) {
                setState(() {}); // Обновляем экран при изменении текста
              },
            ),
            SizedBox(height: 20),
            Text('Укажите дату рождения:'),
            TextButton(
              onPressed: () => _pickDate(context),
              child: Text(_birthDate == null ? 'Выбрать дату' : 'Дата: ${_birthDate!.toLocal()}'.split(' ')[0]),
            ),
            SizedBox(height: 20),
            Text('Имя: ${_nameController.text}'), // Отображение имени моментально
            if (_birthDate != null)
              Text('Дата рождения: ${_birthDate!.toLocal().toString().split(' ')[0]}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _birthDate != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                            'Имя: ${_nameController.text}\nДата рождения: ${_birthDate!.toLocal().toString().split(' ')[0]}'),
                      );
                    },
                  );
                }
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
    }
  }
}