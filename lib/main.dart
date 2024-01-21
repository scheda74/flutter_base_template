import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_template/shared/providers/global_provider_observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_entry.dart';
import 'shared/utils/logger/loggers.dart';
import 'shared/utils/logger/third_party_loggers/matomo/matomo_logger.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Loggers.instance.initialize(
        matomoOptions: const MatomoOptions(siteId: 69, url: ''),
      );

      await SentryFlutter.init(
        (options) {
          // TODO get sentry key
          options.dsn = '';
          // options.dsn = kDebugMode ? '' : F.sentryKey;
          // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
          // We recommend adjusting this value in production.
          options.tracesSampleRate = 1.0;
        },
        appRunner: () => SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]).then(
          (_) => runApp(
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
