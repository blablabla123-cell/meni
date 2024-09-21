import 'package:flutter/material.dart';
import 'package:meni/application/application.dart';
import 'package:meni/application/utils/shared_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedRepository storage = SharedRepository();
  await storage.init();
  runApp(Application(storage: storage));
}
