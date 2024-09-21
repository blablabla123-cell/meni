import 'dart:io';

abstract class StorageInterface {
  File? getFile();

  bool write(String value);

  String? read();
}