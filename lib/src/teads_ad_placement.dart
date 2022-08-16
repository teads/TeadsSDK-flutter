import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';
import 'package:teads_sdk_flutter/src/teads_errors.dart';

mixin TeadsAdPlacementDelegate {
  // When Teads inApp SDK has failed to retrieve an ad
  void didFailToReceiveAd(String reason); // TODO AdFailReason type
}

abstract class TeadsAdPlacement {
  final MethodChannel _channel;

  @protected
  MethodChannel get channel => _channel;

  TeadsAdPlacementDelegate? delegate;

  TeadsAdPlacement(this.delegate, this._channel) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didFailToReceiveAd":
          try {
            final String errorReason = call.arguments[0];
            delegate?.didFailToReceiveAd(errorReason);
          } on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        default:
          break;
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings);
}
