import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/inread/teads_inread_ad.dart';

/// The Teads inRead ad view is responsible to manage a [TeadsInReadAd] instance.
class TeadsInReadAdView extends StatefulWidget {
  final _TeadsInReadAdViewState state = _TeadsInReadAdViewState();

  TeadsInReadAdView({Key? key}) : super(key: key);

  @override
  State<TeadsInReadAdView> createState() => _TeadsInReadAdViewState();

  void bind(TeadsInReadAd ad) {
    state.bind(ad);
  }

  void clean() {
    state.clean();
  }
}

class _TeadsInReadAdViewState extends State<TeadsInReadAdView> {
  /// The method channel used to communicate with the native part.
  /// Internal use only.
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad_view/inread');

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'FLTTeadsInReadAdView';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
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

  void bind(TeadsInReadAd ad) {
    _channel.invokeMethod('bind', [ad.requestIdentifier]);
  }

  void clean() {
    _channel.invokeMethod('clean');
  }
}
