import 'package:flutter/services.dart';

class TeadsAdPlacementSettings {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad_placement_settings');

  /// The [TeadsAdPlacementSettings] map represented value.
  /// Internal use only.
  Map _mapValue = {};
  Map get mapValue => _mapValue;

  /// Disable crash monitoring. It will collect Teads crashes by default.
  Future<void> disableCrashMonitoring() async {
    _mapValue = await _channel.invokeMethod('disableCrashMonitoring');
  }

  /// iOS only. Disable teads audio session management. You will need to handle the audio session manually.
  Future<void> disableTeadsAudioSessionManagement() async {
    _mapValue =
        await _channel.invokeMethod('disableTeadsAudioSessionManagement');
  }

  /// This enable debug logging for Teads inApp SDK.
  Future<void> enableDebug() async {
    _mapValue = await _channel.invokeMethod('enableDebug');
  }

  /// The GDPR status and consent, should match the IAB specifications.
  Future<void> userConsent(String subjectToGDPR, String consent,
      {TCFVersion tcfVersion = TCFVersion.v2, int cmpSdkID = 0}) async {
    _mapValue = await _channel.invokeMethod(
        'userConsent', [subjectToGDPR, consent, tcfVersion.value, cmpSdkID]);
  }

  /// The CCPA consent string, should match the IAB specifications.
  Future<void> setUsPrivacy(String consent) async {
    _mapValue = await _channel.invokeMethod('setUsPrivacy', [consent]);
  }

  /// iOS only. Unauthorize Teads SDK from recording battery status.
  Future<void> disableBatteryMonitoring() async {
    _mapValue = await _channel.invokeMethod('disableBatteryMonitoring');
  }

  /// Add extra data to Teads inApp SDK
  Future<void> addExtras(String value, String key) async {
    _mapValue = await _channel.invokeMethod('addExtras', [value, key]);
  }

  /// Android only. This will enable location for Teads inApp SDK
  Future<void> enableLocation() async {
    _mapValue = await _channel.invokeMethod('enableLocation');
  }

  /// Android only. This will allow Teads inApp SDK to display endscreen with light color
  Future<void> useLightEndScreen() async {
    _mapValue = await _channel.invokeMethod('useLightEndScreen');
  }

  /// Android only. Hide the website url in the internal browser only. The url is visible by default.
  Future<void> hideBrowserUrl() async {
    _mapValue = await _channel.invokeMethod('hideBrowserUrl');
  }

  /// Android only. Set the toolbar background color on the browser.
  Future<void> toolBarBackgroundColor(int color) async {
    _mapValue = await _channel.invokeMethod('toolBarBackgroundColor', [color]);
  }
}

/// EU Transparency & Consent Framework versions
/// Europe General Data Protection Regulation (GDPR) see [Transparency Consent Framework](https://iabeurope.eu/transparency-consent-framework/)
/// Version 1 is no longer supported since 15 of August 2020.
enum TCFVersion { v1, v2 }

extension TCFVersionExtension on TCFVersion {
  int get value {
    switch (this) {
      case TCFVersion.v1:
        return 1;
      case TCFVersion.v2:
        return 2;
      default:
        return 2;
    }
  }
}
