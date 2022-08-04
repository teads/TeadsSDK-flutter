import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';

import '../teads_errors.dart';
import 'teads_native_ad.dart';

mixin TeadsNativeAdPlacementDelegate implements TeadsAdPlacementDelegate {
  void didReceiveAd(TeadsNativeAd ad);
}

class TeadsNativeAdPlacement extends TeadsAdPlacement {
  List<TeadsNativeAd> nativeAds = [];

  TeadsNativeAdPlacement(TeadsNativeAdPlacementDelegate? delegate)
      : super(
            delegate,
            const MethodChannel(
                'teads_sdk_flutter/teads_ad_placement/native')) {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            TeadsNativeAd nativeAd = nativeAds.firstWhere(
                (element) => element.requestIdentifier == requestIdentifier);
            delegate?.didReceiveAd(nativeAd);
          } on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id =
        await channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    nativeAds.add(TeadsNativeAd(id));
    return id;
  }
}
