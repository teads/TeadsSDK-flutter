import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/inread/teads_inread_ad_placement.dart';
import 'package:teads_sdk_flutter/src/native/teads_native_ad_placement.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement_settings.dart';

class Teads {
  static const MethodChannel _channel =
      MethodChannel('teads_sdk_flutter/teads');

  static Future<String?> get sdkVersion async {
    final String? version = await _channel.invokeMethod('sdkVersion');
    return version;
  }

  static Future<TeadsInReadAdPlacement?> createInReadPlacement(
      int pid,
      TeadsAdPlacementSettings settings,
      TeadsInReadAdPlacementDelegate? delegate) async {
    await _channel
        .invokeMethod('createInReadPlacement', [pid, settings.mapValue]);
    final TeadsInReadAdPlacement placement = TeadsInReadAdPlacement(delegate);
    return placement;
  }

  static Future<TeadsNativeAdPlacement?> createNativePlacement(
      int pid,
      TeadsAdPlacementSettings settings,
      TeadsNativeAdPlacementDelegate? delegate) async {
    await _channel
        .invokeMethod('createNativePlacement', [pid, settings.mapValue]);
    final TeadsNativeAdPlacement placement = TeadsNativeAdPlacement(delegate);
    return placement;
  }
}
