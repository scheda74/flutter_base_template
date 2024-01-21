import 'package:flutter/foundation.dart';

import '../../models/log_level.dart';
import '../../models/logger.dart';

class LocalLogger extends Logger {
  const LocalLogger() : super(name: 'LocalLogger');

  @override
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    LogLevel level = LogLevel.error,
  }) {
    String err = '[Error]${level.name} $message';
    err += ' | error: ${error.toString()}';

    if (stackTrace != null) {
      err += ' | stackTrace: ${stackTrace.toString()}';
    }

    debugPrint(err);
  }

  @override
  void logEvent(
    String name, {
    String? category,
    String? action,
    int? value,
    LogLevel level = LogLevel.info,
  }) {
    String event = '[EVENT]${level.name} $name';

    if (category != null) {
      event += ' | category: $category';
    }
    if (action != null) {
      event += ' | action: $action';
    }
    if (value != null) {
      event += ' | value: $value';
    }

    debugPrint(event);
  }

  void logLocal(String message) {
    debugPrint('[LOCAL]${LogLevel.debug} $message');
  }
}
