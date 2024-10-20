import 'package:flutter/material.dart';
import 'package:meni/application/application.dart';
import 'package:meni/application/utils/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final StorageRepository storage = StorageRepository();
  await storage.init();
  runApp(Application(storage: storage));
}
// 1232