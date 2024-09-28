import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Виджет загрузки по центру
          CircularProgressIndicator(),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Переход на главную страницу
                  },
                  child: Text('Главная'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Переход в профиль
                  },
                  child: Text('Профиль'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}