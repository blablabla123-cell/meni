import 'package:flutter/foundation.dart';

enum LogType {
  info('INFO'),
  warning('WARNING');

  final String text;

  const LogType(this.text);
}


class Logger {
  void log(String message, {LogType logType = LogType.info}) {
    // Check if message is Empty
    assert(message.isNotEmpty);

    if (kDebugMode) {
      print('[${logType.text}] - $message');
    }
  }
}