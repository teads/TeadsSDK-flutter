import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

class TeadsInReadAdPlacement {

  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_inread_ad_placement');

  TeadsInReadAdPlacementDelegate? delegate;

  TeadsInReadAdPlacement(this.delegate) {
    _channel.setMethodCallHandler((call) async {
      switch(call.method) {
        case "didReceiveAd":
          delegate?.didReceiveAd(TeadsInReadAd(), TeadsAdRatio());
          break;
        case "didUpdateRatio":
          delegate?.didUpdateRatio(TeadsInReadAd(), TeadsAdRatio());
          break;
        default:
          break;
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id = await _channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    return id;
  }
}
