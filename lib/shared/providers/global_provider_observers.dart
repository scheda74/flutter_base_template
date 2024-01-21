import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker_logger_bundle/tracker_logger_bundle.dart';

import '../../app_entry.dart';

class GlobalProviderObservers extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // Log.instance.logEvent(
    //   'Provider $provider updated from $previousValue to $newValue',
    //   level: LogLevel.debug,
    // );
    if (newValue is AsyncError) {
      return _handleError(
        provider,
        newValue.error,
        newValue.stackTrace,
      );
    }
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _handleError(provider, error, stackTrace);
  }

  void _handleError(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
  ) {
    Log.instance.logError(
      'Provider $provider threw $error at $stackTrace',
      error: error,
      stackTrace: stackTrace,
      level: LogLevel.error,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(error.toString()),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
