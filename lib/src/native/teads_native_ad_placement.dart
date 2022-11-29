import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';

import '../teads_errors.dart';
import 'teads_native_ad.dart';

/// Delegate methods needed to follow Teads native ad requests flow.
mixin TeadsNativeAdPlacementDelegate implements TeadsAdPlacementDelegate {
  /// Called when the Teads SDK has received a native [ad] for you to display.
  void didReceiveAd(TeadsNativeAd ad);
}

/// Native ad placement to request native ads.
///
/// This class is reponsible for performing request and is tied to you PID (placement identifier).
/// In order to create placement, you should call the [Teads] method [createNativePlacement()].
///
/// See [Native implementation guide](https://support.teads.tv/support/solutions/articles/36000388693-native-ad-classic-integration) documentation.
class TeadsNativeAdPlacement extends TeadsAdPlacement {

  /// The list of [TeadsNativeAd] that have been served by our servers.
  final List<TeadsNativeAd> _nativeAds = [];

  TeadsNativeAdPlacement(TeadsNativeAdPlacementDelegate? delegate)
      : super(
            delegate,
            const MethodChannel(
                'teads_sdk_flutter/teads_ad_placement/native')) {
    channel.setMethodCallHandler((call) async {
      methodCallHandler(call);
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            TeadsNativeAd nativeAd = _nativeAds.firstWhere(
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

  /// Request a Native ad on this placement.
  /// listen for events by implementing [TeadsNativeAdPlacementDelegate].
  ///
  /// Use [requestSettings] [TeadsNativeAdRequestSettings] to tweak your needs.
  /// Returns a unique request identifier, this identifier will be the same value of [TeadsNativedAd.requestIdentifier] property.
  /// The [TeadsNativeAdPlacement] [delegate] property must be set to perform ad request, otherwise didReceiveAd will not be triggered.
  @override
  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id =
        await channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    _nativeAds.add(TeadsNativeAd(id));
    return id;
  }
}
