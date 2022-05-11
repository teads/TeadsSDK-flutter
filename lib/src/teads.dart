import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

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
}
