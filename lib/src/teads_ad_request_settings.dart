import 'package:flutter/services.dart';

class TeadsAdRequestSettings {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad_request_settings');

  /// The [TeadsAdRequestSettings] map represented value.
  /// Internal use only.
  Map _mapValue = {};
  Map get mapValue => _mapValue;

  /// This enable the validation tool mode for Teads inApp SDK.
  Future<void> enableValidationMode() async {
    _mapValue = await _channel.invokeMethod('enableValidationMode');
  }

  /// This gives context to Teads inApp SDK for Brand Safety.
  Future<void> pageUrl(String urlString) async {
    _mapValue = await _channel.invokeMethod('pageUrl', [urlString]);
  }

  /// Add extra data to Teads inApp SDK.
  Future<void> addExtras(String value, String key) async {
    _mapValue = await _channel.invokeMethod('addExtras', [value, key]);
  }
}
