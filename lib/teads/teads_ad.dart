import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/teads/teads_controller.dart';
import 'package:flutter_app/teads/teads_settings.dart';

typedef TeadsViewCreatedCallback = void Function();
typedef OnRatioUpdated = void Function(double adRatio);

class TeadsAd extends StatelessWidget {
  TeadsAd(
      {Key key,
      @required this.pid,
      @required this.onRatioUpdated,
      this.onTeadsViewCreated,
      this.settings})
      : super(key: key);

  final int pid;
  TeadsAdSettings settings = TeadsAdSettings();
  final OnRatioUpdated onRatioUpdated;
  final TeadsViewCreatedCallback onTeadsViewCreated;
  static const StandardMessageCodec _decoder = StandardMessageCodec();

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _renderAndroid();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _renderiOS();
    }
  }

  Widget _renderiOS() {
    return UiKitView(
        viewType: 'TeadsPlatformView',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: _createParams(),
        creationParamsCodec: _decoder);
  }

  Widget _renderAndroid() {
    return PlatformViewLink(
      viewType: 'TeadsPlatformView',
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: 'TeadsPlatformView',
          layoutDirection: TextDirection.ltr,
          creationParams: _createParams(),
          creationParamsCodec: StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
          ..create();
      },
    );
  }

  Map<String, dynamic> _createParams() {
    var map = settings.toMap();

    map["pid"] = this.pid;

    return map;
  }

  void _onPlatformViewCreated(int id) {
    this.onTeadsViewCreated();
    TeadsViewController(id: id, onRatioUpdated: onRatioUpdated);
  }
}
