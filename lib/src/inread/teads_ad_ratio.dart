import 'package:flutter/services.dart';

/// This class is used to help in resizing a given ad view to a given aspect ratio.
class TeadsAdRatio {
  TeadsAdRatio(this.adRequestIdentifier);

  /// The method channel used to communicate with the native part.
  /// Internal use only.
  static const MethodChannel _channel =
      MethodChannel('teads_sdk_flutter/teads_ad_ratio');

  /// The ad request identifier used to match with the native side.
  /// - important:  Internal only.
  String adRequestIdentifier;

  /// Compute the best height for your [TeadsInReadAdView] with the given [width].
  ///
  /// Returns the calculated height that fit the creative aspect ratio.
  Future<double> calculateHeight(double width) async {
    return await _channel
        .invokeMethod("calculateHeight", [width, adRequestIdentifier]);
  }

  /// Get a [double] ratio for a given [width].
  ///
  /// Returns the ratio corresponding to the given [width].
  Future<double> value(double width) async {
    return await _channel.invokeMethod("value", [width, adRequestIdentifier]);
  }
}
