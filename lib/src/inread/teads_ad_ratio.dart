import 'package:flutter/services.dart';

class TeadsAdRatio {
  static const MethodChannel _channel = MethodChannel('teads_sdk_flutter/teads_ad_ratio');

  String adRequestIdentifier;

  TeadsAdRatio(this.adRequestIdentifier);

  Future<double> calculateHeight(double width) async {
    return await _channel.invokeMethod("calculateHeight", [width, adRequestIdentifier]);
  }

  Future<double> value(double width) async {
    return await _channel.invokeMethod("value", [width, adRequestIdentifier]);
  }
}
