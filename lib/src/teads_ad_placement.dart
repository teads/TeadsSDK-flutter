import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';

mixin TeadsAdPlacementDelegate {
  void didFailToReceiveAd(String reason); // TODO AdFailReason type
  void adOpportunityTrackerView(String trackerView); // TODO TeadsAdOpportunityTrackerView
}

abstract class TeadsAdPlacement {

  final MethodChannel _channel;
  @protected MethodChannel get channel => _channel;

  TeadsAdPlacementDelegate? delegate;

  TeadsAdPlacement(this.delegate, this._channel) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didFailToReceiveAd":
          delegate?.didFailToReceiveAd("");
          break;
        case "adOpportunityTrackerView":
          delegate?.adOpportunityTrackerView("");
          break;
        default:
          break;
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings);
}
