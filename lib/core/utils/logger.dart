import 'dart:developer';

class Logger {
  static void debug(String message) {
    log('[DEBUG]: $message');
  }

  static void error(String message, [Object? error]) {
    log('[ERROR]: $message', error: error);
  }
}
