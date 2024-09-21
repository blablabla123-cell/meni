import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:meni/application/utils/storage_interface.dart';

class StorageRepository implements StorageInterface {
  @override
  File? getFile() {
    String? path;

    getApplicationDocumentsDirectory().then((Directory directory) {
      path = directory.path;
    }).catchError((dynamic error) {
      // TODO:
    });

    if (path != null) {
      return File('$path/user_database.txt');
    }

    return null;
  }

  @override
  bool write(String value) {
    final File? file = getFile();

    if (file != null) {
      file.writeAsStringSync(value);
      return true;
    }
    return false;
  }

  @override
  String? read() {
    final File? file = getFile();

    if (file != null) {
      return file.readAsStringSync();
    }

    return null;
  }
}
