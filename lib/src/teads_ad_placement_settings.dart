import 'package:flutter/services.dart';

class TeadsAdPlacementSettings {
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad_placement_settings');
  Map mapValue = {};

  TeadsAdPlacementSettings();

  Future<void> disableCrashMonitoring() async {
    mapValue = await _channel.invokeMethod('disableCrashMonitoring');
  }

  Future<void> disableTeadsAudioSessionManagement() async {
    mapValue =
        await _channel.invokeMethod('disableTeadsAudioSessionManagement');
  }

  Future<void> enableDebug() async {
    mapValue = await _channel.invokeMethod('enableDebug');
  }

  Future<void> userConsent(String subjectToGDPR, String consent,
      {TCFVersion tcfVersion = TCFVersion.v2, int cmpSdkID = 0}) async {
    mapValue = await _channel.invokeMethod(
        'userConsent', [subjectToGDPR, consent, tcfVersion.value, cmpSdkID]);
  }

  Future<void> setUsPrivacy(String consent) async {
    mapValue = await _channel.invokeMethod('setUsPrivacy', [consent]);
  }

  Future<void> disableBatteryMonitoring() async {
    mapValue = await _channel.invokeMethod('disableBatteryMonitoring');
  }

  Future<void> addExtras(String value, String key) async {
    mapValue = await _channel.invokeMethod('addExtras', [value, key]);
  }
}

enum TCFVersion { v1, v2 }

extension TCFVersionExtension on TCFVersion {
  int get value {
    switch (this) {
      case TCFVersion.v1:
        return 1;
      case TCFVersion.v2:
        return 2;
      default:
        return 1;
    }
  }
}
