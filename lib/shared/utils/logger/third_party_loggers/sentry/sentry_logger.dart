import 'package:sentry_flutter/sentry_flutter.dart';

import '../../models/log_level.dart';
import '../../models/logger.dart';

class SentryLogger extends Logger {
  const SentryLogger() : super(name: 'SentryLogger');

  @override
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    LogLevel level = LogLevel.error,
  }) {
    if (level == LogLevel.debug) {
      return;
    }
    Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  }

  @override
  void logEvent(
    String name, {
    String? category,
    String? action,
    int? value,
    LogLevel level = LogLevel.info,
  }) {
    if (level == LogLevel.debug) {
      return;
    }
    Sentry.captureMessage(
      name,
      params: [
        {'category': category, 'action': action, 'value': value},
      ],
      level: _convertLogLevelToSentryLevel(level),
    );
  }

  SentryLevel _convertLogLevelToSentryLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return SentryLevel.debug;
      case LogLevel.info:
        return SentryLevel.info;
      case LogLevel.warning:
        return SentryLevel.warning;
      case LogLevel.error:
        return SentryLevel.error;
      case LogLevel.exception:
        return SentryLevel.fatal;
    }
  }
}
