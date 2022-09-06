import 'dart:developer' as developer;

class DevelopmentLogger {
  void debug(String message) {
    developer.log('\x1B[37m[DEBUG] $message\x1B[0m');
  }

  void error(String message) {
    developer.log('\x1B[31m[ERROR] $message\x1B[0m');
  }

  void info(String message) {
    developer.log('\x1B[32m[INFO] $message\x1B[0m');
  }

  void warn(String message) {
    developer.log('\x1B[33m[WARN] $message\x1B[0m');
  }
}

final logger = DevelopmentLogger();
