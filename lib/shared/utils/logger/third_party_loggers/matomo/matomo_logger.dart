import 'package:flutter/foundation.dart';
import 'package:matomo_tracker/matomo_tracker.dart';

import '../../models/log_level.dart';
import '../../models/logger.dart';

class MatomoOptions {
  final int siteId;
  final String url;
  final Level verbosityLevel;

  const MatomoOptions({
    required this.siteId,
    required this.url,
    this.verbosityLevel = Level.off,
  });
}

class MatomoLogger extends Logger {
  const MatomoLogger() : super(name: 'MatomoLogger');

  Future<void> initialize(MatomoOptions options) async {
    debugPrint(
      'Initializing Matomo for ${options.url} with siteId ${options.siteId} and verbosityLevel ${options.verbosityLevel}...',
    );
    MatomoTracker.instance.initialize(
      siteId: options.siteId,
      url: options.url,
      verbosityLevel: options.verbosityLevel,
    );
  }

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
    MatomoTracker.instance.trackEvent(
      eventInfo: EventInfo(
        category: 'error',
        name: error.toString(),
        action: stackTrace.toString(),
      ),
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
    MatomoTracker.instance.trackEvent(
      eventInfo: EventInfo(
        name: name,
        category: category ?? '-',
        action: action ?? '-',
        value: value,
      ),
    );
  }
}
