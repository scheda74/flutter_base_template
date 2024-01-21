import 'package:sentry_flutter/sentry_flutter.dart';

import 'models/log_level.dart';
import 'models/logger.dart';
import 'third_party_loggers/local/local_logger.dart';
import 'third_party_loggers/matomo/matomo_logger.dart';
import 'third_party_loggers/sentry/sentry_logger.dart' as sentry;

export 'models/log_level.dart';

class Loggers extends Logger {
  late List<Logger> plugins;

  Loggers._internal() : super(name: 'All Loggers') {
    plugins = [
      const MatomoLogger(),
      const sentry.SentryLogger(),
      const LocalLogger(),
    ];
  }

  static final Loggers _instance = Loggers._internal();
  static Loggers get instance => _instance;

  void initialize({
    required MatomoOptions matomoOptions,
    SentryOptions? sentryOptions,
  }) {
    for (final plugin in plugins) {
      if (plugin is MatomoLogger) {
        plugin.initialize(matomoOptions);
      }
    }
  }

  @override
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    LogLevel level = LogLevel.error,
  }) {
    for (final plugin in plugins) {
      plugin.logError(
        message,
        error: error,
        stackTrace: stackTrace,
        level: level,
      );
    }
  }

  @override
  void logEvent(
    String name, {
    String? category,
    String? action,
    int? value,
    LogLevel level = LogLevel.info,
  }) {
    for (final plugin in plugins) {
      plugin.logEvent(
        name,
        category: category,
        action: action,
        value: value,
        level: level,
      );
    }
  }

  void logLocal(String message) {
    for (final plugin in plugins) {
      if (plugin is LocalLogger) {
        plugin.logLocal(message);
      }
    }
  }

  List<String> getActiveTrackerNames() {
    return plugins.map((t) => t.name).toList();
  }
}
