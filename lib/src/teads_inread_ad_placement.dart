import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

class TeadsInReadAdPlacement {

  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_inread_ad_placement');

  TeadsInReadAdPlacementDelegate? delegate;
  TeadsInReadAd? teadsAd;

  TeadsInReadAdPlacement(this.delegate) {
    _channel.setMethodCallHandler((call) async {
      if (teadsAd != null) {
        switch (call.method) {
          case "didReceiveAd":
            delegate?.didReceiveAd(teadsAd!, TeadsAdRatio());
            break;
          case "didUpdateRatio":
            delegate?.didUpdateRatio(teadsAd!, TeadsAdRatio());
            break;
          default:
            break;
        }
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id = await _channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    teadsAd = TeadsInReadAd(id, this);
    return id;
  }
}
