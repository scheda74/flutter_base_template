import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<NetworkInterface?> getNetworkInterface() async {
  final interfaces = await NetworkInterface.list(
    type: InternetAddressType.IPv4,
  );

  return interfaces.firstWhere((element) => element.name == 'en0');
}

Future<String?> getIPAddress() async {
  final interface = await getNetworkInterface();
  return interface?.addresses.first.address;
}

Future<Map<String, String>> getDeviceMetaInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidDeviceInfo;
  IosDeviceInfo? iosDeviceInfo;
  Map<String, String> meta = {};
  if (Platform.isAndroid) {
    androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    meta['manufacturer'] = androidDeviceInfo.manufacturer;
    meta['model'] = androidDeviceInfo.model;
    meta['osVersion'] = androidDeviceInfo.version.release;
    meta['fingerprint'] = androidDeviceInfo.fingerprint;
  } else if (Platform.isIOS) {
    iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    meta['model'] = iosDeviceInfo.model;
    meta['osVersion'] = iosDeviceInfo.systemVersion;
    meta['fingerprint'] = iosDeviceInfo.identifierForVendor ?? '-';
  }

  meta['ip'] = await getIPAddress() ?? 'unknown';
  meta['timestamp'] = DateTime.now().millisecondsSinceEpoch.toString();

  return meta;
}

class Tracker {}
