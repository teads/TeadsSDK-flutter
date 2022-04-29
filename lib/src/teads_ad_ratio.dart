import 'package:flutter/services.dart';

class TeadsAdRatio {
  static const MethodChannel _channel = MethodChannel('teads_sdk_flutter/teads_ad_ratio');

  Future<double> calculateHeight(double width) async {
    return await _channel.invokeMethod("calculateHeight", [width]);
  }

  Future<double> value(double width) async {
    return await _channel.invokeMethod("value", [width]);
  }
}
