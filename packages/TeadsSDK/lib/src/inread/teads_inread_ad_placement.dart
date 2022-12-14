import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/inread/teads_ad_ratio.dart';
import 'package:teads_sdk_flutter/src/inread/teads_inread_ad.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';
import 'package:teads_sdk_flutter/src/teads_errors.dart';

/// The map used to match a [TeadsInReadAd] instance with a [TeadsAdRatio] instance.
class InReadAdAdRatioMap {
  InReadAdAdRatioMap(this.inReadAd, this.adRatio);

  TeadsInReadAd inReadAd;
  TeadsAdRatio adRatio;
}

/// Delegate methods needed to follow Teads inRead ad requests flow.
mixin TeadsInReadAdPlacementDelegate implements TeadsAdPlacementDelegate {
  /// Called when the Teads SDK has received an [ad] for you to display.
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio);

  /// Called when the Teads SDK needs you to resize your adView the creative inform us of its new [adRatio].
  ///
  /// ``` dart
  /// @override
  /// void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
  ///   double width = MediaQuery.of(context).size.width;
  ///   double height = await adRatio.calculateHeight(width);
  ///   setState(() {
  ///     yourAdViewHeight = height;
  ///   });
  /// }
  /// ```
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio);
}

/// InRead ad placement to request inRead ads.
///
/// This class is reponsible for performing request and is tied to you PID (placement identifier).
/// In order to create placement, you should call the [Teads] method [createInReadPlacement()].
///
/// See [InRead implementation guide](https://support.teads.tv/support/solutions/articles/36000388692-inread-classic-integration) documentation.
class TeadsInReadAdPlacement extends TeadsAdPlacement {
  /// The [InReadAdAdRatioMap] instance.
  List<InReadAdAdRatioMap> inReadAdAdRatioMaps = [];

  TeadsInReadAdPlacement(TeadsInReadAdPlacementDelegate? delegate)
      : super(
            delegate,
            const MethodChannel(
                'teads_sdk_flutter/teads_ad_placement/inread')) {
    channel.setMethodCallHandler((call) async {
      methodCallHandler(call);
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap =
                inReadAdAdRatioMaps.firstWhere((element) =>
                    element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didReceiveAd(
                inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          } on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        case "didUpdateRatio":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap =
                inReadAdAdRatioMaps.firstWhere((element) =>
                    element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didUpdateRatio(
                inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          } on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        default:
          break;
      }
    });
  }

  /// Request an InRead ad on this placement
  /// listen for events by implementing [TeadsInReadAdPlacementDelegate]
  ///
  /// Use [requestSettings] [TeadsInReadAdRequestSettings] to tweak your needs
  /// Returns a unique request identifier, this identifier will be the same value of [TeadsInReadAd.requestIdentifier] property.
  /// The [TeadsInReadAdPlacement] [delegate] property must be set to perform ad request, otherwise didReceiveAd will not be triggered.
  @override
  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id =
        await channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    inReadAdAdRatioMaps
        .add(InReadAdAdRatioMap(TeadsInReadAd(id), TeadsAdRatio(id)));
    return id;
  }
}
