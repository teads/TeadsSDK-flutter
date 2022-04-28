import 'package:flutter/services.dart';

class TeadsAdRequestSettings {

  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_ad_request_settings');
  Map mapValue = {};

  TeadsAdRequestSettings();

  Future<void> enableValidationMode() async {
    mapValue = await _channel.invokeMethod('enableValidationMode');
  }

  Future<void> pageUrl(String urlString) async {
    mapValue = await _channel.invokeMethod('pageUrl', [urlString]);
  }

  Future<void> addExtras(String value, String key) async {
    mapValue = await _channel.invokeMethod('addExtras', [value, key]);
  }

}
