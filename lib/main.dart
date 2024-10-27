import 'package:flutter/material.dart';
import 'package:meni/application/application.dart';
import 'package:meni/application/utils/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final StorageRepository storage = StorageRepository();
  await storage.init();
  print(storage.read());
  runApp(Application(storage: storage));
}