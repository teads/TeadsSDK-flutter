import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/inread/teads_inread_ad_placement.dart';
import 'package:teads_sdk_flutter/src/native/teads_native_ad_placement.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement_settings.dart';

class Teads {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  static const MethodChannel _channel =
      MethodChannel('teads_sdk_flutter/teads');

  /// Current Teads SDK Version value.
  ///
  /// Value is [semver](https://semver.org/) format compliant.
  static Future<String?> get sdkVersion async {
    final String? version = await _channel.invokeMethod('sdkVersion');
    return version;
  }

  /// Create an inRead ad placement to request inRead ads.
  ///
  /// Pass your Teads [pid] (placement identifier) for **inRead** ads.
  /// You can pass the placement's related [settings] you want to apply.
  /// You must set the [delegate] to follow the ad placement lifecycle.
  /// Returns a [TeadsInReadAdPlacement] instance.
  ///
  /// See [InRead implementation guide](https://support.teads.tv/support/solutions/articles/36000388692-inread-classic-integration) documentation.
  static Future<TeadsInReadAdPlacement?> createInReadPlacement(
      int pid,
      TeadsAdPlacementSettings settings,
      TeadsInReadAdPlacementDelegate? delegate) async {
    await _channel
        .invokeMethod('createInReadPlacement', [pid, settings.mapValue]);
    final TeadsInReadAdPlacement placement = TeadsInReadAdPlacement(delegate);
    return placement;
  }

  /// Create a native ad placement to request native ads.
  ///
  /// Pass your Teads [pid] (placement identifier) for **native** ads.
  /// You can pass the placement's related [settings] you want to apply.
  /// You must set the [delegate] to follow the ad placement lifecycle.
  /// Returns a [TeadsNativeAdPlacement] instance.
  ///
  /// See [Native implementation guide](https://support.teads.tv/support/solutions/articles/36000388693-native-ad-classic-integration) documentation.
  static Future<TeadsNativeAdPlacement?> createNativePlacement(
      int pid,
      TeadsAdPlacementSettings settings,
      TeadsNativeAdPlacementDelegate? delegate) async {
    await _channel
        .invokeMethod('createNativePlacement', [pid, settings.mapValue]);
    final TeadsNativeAdPlacement placement = TeadsNativeAdPlacement(delegate);
    return placement;
  }
}
