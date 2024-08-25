import 'package:flutter/material.dart';
import 'package:meni/logger.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(name: 'Vadim');
  }
}

class Content extends StatefulWidget {
  const Content({required this.name, super.key});

  final String name;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final Logger logger = Logger();
  String? country;

  @override
  void initState() {
    super.initState();
    country = 'Romania';
    logger.log('Init state');
  }

  @override
  void dispose() {
    country = null;
    logger.log('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.log('Build');
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text('Hello, ${widget.name}'),
            IconButton(
              icon: const Icon(Icons.access_alarm_outlined),
              onPressed: () => setState(() {
                country = 'Kazachstan';
              }),
            ),
          ],
        ),
        Country(country: country ?? 'Serbia'), // if-null
      ],
    );
  }
}

class Country extends StatelessWidget {
  const Country({required this.country, super.key});
  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(Icons.flag),
        Text(country),
      ],
    );
  }
}
