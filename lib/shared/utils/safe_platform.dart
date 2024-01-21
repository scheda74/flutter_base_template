import 'dart:io';

import 'package:flutter/foundation.dart';

/// as Platform.<isPlatform> calls fail with an exception in the web environment
/// this enum class provides a safe way to access the platform without crashing
enum SafePlatform {
  web,
  android,
  ios,
  macos,
  windows,
  linux;

  static SafePlatform get currentPlatform {
    if (kIsWeb) {
      return SafePlatform.web;
    }
    if (Platform.isAndroid) {
      return SafePlatform.android;
    }
    if (Platform.isIOS) {
      return SafePlatform.ios;
    }
    if (Platform.isMacOS) {
      return SafePlatform.macos;
    }
    if (Platform.isWindows) {
      return SafePlatform.windows;
    }
    if (Platform.isLinux) {
      return SafePlatform.linux;
    }
    throw UnsupportedError('Platform not supported');
  }

  static bool get isWeb => SafePlatform.currentPlatform == SafePlatform.web;
  static bool get isAndroid =>
      SafePlatform.currentPlatform == SafePlatform.android;
  static bool get isIos => SafePlatform.currentPlatform == SafePlatform.ios;
  static bool get isMacOS => SafePlatform.currentPlatform == SafePlatform.macos;
  static bool get isWindows =>
      SafePlatform.currentPlatform == SafePlatform.windows;
  static bool get isLinux => SafePlatform.currentPlatform == SafePlatform.linux;
}
