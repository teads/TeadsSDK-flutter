import 'package:teads_sdk_flutter/src/teads_ad.dart';

/// Represents an ad that will be displayed by the native code of the application.
/// The ad display is fully customizable.
///
/// Your class widget should conform to [TeadsAdDelegate] in order to follow the ad lifecycle.
///
/// At the opposite of [TeadsInReadAd] object, the [TeadsNativeAd] only contains informations that needs to be displayed.
/// It does not create any view for the actual display: your application is responsible of the ad rendering.
/// We strongly advise to use [TeadsNativeAdView] to bind your [TeadsNativeAd] instance.
class TeadsNativeAd extends TeadsAd {
  TeadsNativeAd(String requestIdentifier) : super(requestIdentifier);
}
