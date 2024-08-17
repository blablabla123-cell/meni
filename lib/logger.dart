
class Logger {

  log({required String message }) {
    // Check if message is empty
    assert(message.isNotEmpty);

    print('[LOG] - $message');
  }
}