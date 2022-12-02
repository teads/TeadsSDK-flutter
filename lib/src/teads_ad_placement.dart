import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';
import 'package:teads_sdk_flutter/src/teads_errors.dart';

/// Root placement delegate methods needed to follow Teads ad requests flow.
mixin TeadsAdPlacementDelegate {
  // When Teads inApp SDK has failed to retrieve an ad.
  void didFailToReceiveAd(String reason); // TODO AdFailReason type
}

/// Root ad placement inherited by [TeadsInReadAdPlacement] & [TeadsNativeAdPlacement].
abstract class TeadsAdPlacement {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel;
  @protected
  MethodChannel get channel => _channel;

  /// The delegate needed to follow the ad placement lifecycle.
  TeadsAdPlacementDelegate? delegate;

  void methodCallHandler(MethodCall call) {
    switch (call.method) {
      case "didFailToReceiveAd":
        try {
          final String errorReason = call.arguments[0];
          delegate?.didFailToReceiveAd(errorReason);
        } on StateError {
          throw Exception(badArgumentsErrorMessage);
        }
        break;
      case "didLogMessage":
        try {
          final String message = call.arguments[0];
          debugPrint(message);
        } on StateError {
          throw Exception(badArgumentsErrorMessage);
        }
        break;
      default:
        break;
    }
  }

  TeadsAdPlacement(this.delegate, this._channel);

  /// Request a Teads ad.
  Future<String> requestAd(TeadsAdRequestSettings requestSettings);
}
