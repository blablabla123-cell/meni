import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meni/application/utils/network_repository.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/models/horoscope.dart';

class HoroscopeNavBarItem extends StatefulWidget {
  const HoroscopeNavBarItem({required this.network, super.key});
  final NetworkRepository network;

  @override
  State<HoroscopeNavBarItem> createState() => _HoroscopeNavBarItemState();
}

class _HoroscopeNavBarItemState extends State<HoroscopeNavBarItem> {
  String data = 'No data';

  void fetchHoroscope() async {
    const String parameters = '?sign=Leo';
    final Response response = await widget.network.getRequest('/get-horoscope/daily', parameters);
    final Map<String, dynamic> horoscopeMap = jsonDecode(response.body);
    final Horoscope horoscope = Horoscope.fromJson(horoscopeMap);
    setState(() => data = horoscope.data.horoscopeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CoreElevatedButton(
                      title: 'Get Hororscope for today',
                      onPressed: () => fetchHoroscope()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
