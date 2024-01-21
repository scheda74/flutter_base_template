import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_template/shared/providers/global_provider_observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tracker_logger_bundle/tracker_logger_bundle.dart';

import 'app_entry.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Log.instance.initialize(
        sentryConfig: SentryConfig(
          optionsConfiguration: (options) {
            // options.dsn = kDebugMode ? '' : F.sentryKey;
            // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0;
          },
          appRunner: () => runApp(
            ProviderScope(
              observers: [GlobalProviderObservers()],
              child: const AppEntry(),
            ),
          ),
        ),
      );
    },
    (error, stack) async => await Sentry.captureException(
      error,
      stackTrace: stack,
    ),
  );
}
