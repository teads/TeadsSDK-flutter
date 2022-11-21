import 'package:teads_sdk_flutter/src/teads_ad.dart';

/// A [TeadsInReadAd] represents an InRead ad that will be binded to a [TeadsInReadAdView] instance.
///
/// This instance is returned through the [TeadsInReadAdPlacementDelegate] delegate method [didReceiveAd()].
/// You need use [TeadsInReadAdView] to bind a [TeadsInReadAd]
class TeadsInReadAd extends TeadsAd {
  TeadsInReadAd(String requestIdentifier) : super(requestIdentifier);
}
