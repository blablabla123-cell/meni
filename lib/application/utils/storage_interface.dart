import 'dart:io';

abstract class StorageInterface {
  File? file;

  Future<bool> init();

  bool write(String key, String value);

  String? read();
}