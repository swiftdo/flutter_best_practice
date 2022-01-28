import 'package:logger/logger.dart';

class MyLog {
  late Logger _log;
  MyLog({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
    Level? level,
  }) {
    _log = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        colors: false,
        printTime: false,
        errorMethodCount: 4,
        methodCount: 2,
      ),
    );
  }

  /// Log a message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(message, error, stackTrace);
  }

  /// 只有错误的日志才会上报给sentry
  /// Log a message at level [Level.error].
  void e({String message = "error", dynamic error, StackTrace? stackTrace}) {
    _log.e("$message:$error", error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.wtf(message, error, stackTrace);
  }

  /// Log a message with [level].
  void log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    _log.log(level, message, error, stackTrace);
  }

  void close() {
    _log.close();
  }
}
