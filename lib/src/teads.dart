import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

class Teads {
  static const MethodChannel _channel = MethodChannel('teads_sdk_flutter');

  static Future<String?> get sdkVersion async {
    final String? version = await _channel.invokeMethod('sdkVersion');
    return version;
  }

  static Future<TeadsInReadAdPlacement?> createInReadPlacement(
      int pid,
      TeadsAdPlacementSettings settings,
      TeadsInReadAdPlacementDelegate? delegate) async {
    final TeadsInReadAdPlacement? placement = await _channel
        .invokeMethod('createInReadPlacement', [pid, settings, delegate]);
    return placement;
  }
}
