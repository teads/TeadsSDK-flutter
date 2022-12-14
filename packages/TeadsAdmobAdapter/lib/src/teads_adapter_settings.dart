import 'package:flutter/services.dart';
import 'package:teads_admob_adapter/src/media_scale.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

class TeadsAdapterSettings {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel =
      const MethodChannel('teads_admob_adapter/teads_adapter_settings');

  /// The [TeadsAdapterSettings] map represented value.
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

  /// This enable debug logging for Teads inApp SDK.
  Future<void> enableDebug() async {
    _mapValue = await _channel.invokeMethod('enableDebug');
  }

  /// This enable the validation tool mode for Teads inApp SDK.
  Future<void> enableValidationMode() async {
    _mapValue = await _channel.invokeMethod('enableValidationMode');
  }

  /// This gives context to Teads inApp SDK for Brand Safety.
  Future<void> pageUrl(String urlString) async {
    _mapValue = await _channel.invokeMethod('pageUrl', [urlString]);
  }

  /// This is to set how the MediaView scale on its container. You can switch between CENTER_CROP (default) and CENTER_INSIDE.
  Future<void> setMediaScale(MediaScale mediaScale) async {
    _mapValue =
        await _channel.invokeMethod('setMediaScale', [mediaScale.index]);
  }

  /// Add extra AdPlacement data to Teads inApp SDK
  Future<void> addPlacementExtra(String value, String key) async {
    _mapValue = await _channel.invokeMethod('addPlacementExtra', [value, key]);
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
