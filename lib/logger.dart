import 'package:flutter/foundation.dart';

class Logger {
  void log(String message) {
    // Check if message is Empty
    assert(message.isNotEmpty);

    if (kDebugMode) {
      print('[LOG] - $message');
    }
  }
}
