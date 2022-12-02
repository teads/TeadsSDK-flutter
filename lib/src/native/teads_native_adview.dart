import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'teads_native_ad.dart';

/// The Teads native ad view is responsible to manage a Teads native ad.
class TeadsNativeAdView extends StatefulWidget {
  final _TeadsNativeAdViewState state = _TeadsNativeAdViewState();

  /// The factory identifier used to match the native design implementation.
  final String factoryId;

  TeadsNativeAdView({Key? key, required this.factoryId}) : super(key: key);

  @override
  State<TeadsNativeAdView> createState() => _TeadsNativeAdViewState();

  /// Call this function to bind a native [ad] to your [TeadsNativeAdView].
  ///
  /// This call is mandatory in order to monitor ad viewability for each components.
  void bind(TeadsNativeAd ad) {
    state.bind(ad);
  }

  void clean() {
    state.clean();
  }
}

class _TeadsNativeAdViewState extends State<TeadsNativeAdView> {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad_view/native');

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'FLTTeadsNativeAdView';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'factoryId': widget.factoryId
    };
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return widget on Android.
        return _renderAndroid(viewType, creationParams);
      case TargetPlatform.iOS:
        // return widget on iOS.
        return _renderiOS(viewType, creationParams);
      default:
        throw UnsupportedError('Unsupported platform view');
    }
  }

  /// Render the iOS component
  Widget _renderiOS(viewType, creationParams) {
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  /// Render the Android component
  Widget _renderAndroid(viewType, creationParams) {
    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () {
            params.onFocusChanged(true);
          },
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }

  /// Call this function to bind a native [ad] to your [TeadsNativeAdView].
  ///
  /// This call is mandatory in order to monitor ad viewability for each components.
  void bind(TeadsNativeAd ad) {
    _channel.invokeMethod('bind', [ad.requestIdentifier]);
  }

  void clean() {
    _channel.invokeMethod('clean');
  }
}
