import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:meni/application/utils/storage_interface.dart';

class StorageRepository implements StorageInterface {
  @override
  bool write(String key, String value) {
    if (file == null) return false;
    try {
      final String? content = read();
      if (content != null) {
        if (content.contains(key)) {
          return false;
        }
      }

      file?.writeAsStringSync('$key=$value', mode: FileMode.append);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  String? read() {
    if (file == null) return null;
    try {
      return file?.readAsStringSync();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> init() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      file = File('${directory.path}/user_database.txt');
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  File? file;
}
