import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

mixin TeadsAdDelegate {
  void willPresentModalView(TeadsAd ad);
  void didCatchError(TeadsAd ad, FlutterError error);
  void didClose(TeadsAd ad);
  void didRecordImpression(TeadsAd ad);
  void didRecordClick(TeadsAd ad);
  void didExpandedToFullscreen(TeadsAd ad);
  void didCollapsedFromFullscreen(TeadsAd ad);
}

mixin TeadsPlaybackDelegate {
  void adStartPlayingAudio(TeadsAd ad);
  void adStopPlayingAudio(TeadsAd ad);
  void didPlay(TeadsAd ad);
  void didPause(TeadsAd ad);
  void didComplete(TeadsAd ad);
}

class TeadsAd {
  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_ad');

  TeadsAdDelegate? _delegate;
  TeadsPlaybackDelegate? _playbackDelegate;
  String requestIdentifier;

  TeadsAd(this.requestIdentifier) {
    _channel.setMethodCallHandler((call) async {
      switch(call.method) {
        case "willPresentModalView":
          _delegate?.willPresentModalView(this);
          break;
        case "didCatchError":
          try {
            final String errorLocalizedDescription = call.arguments[1];
            FlutterError error = FlutterError(errorLocalizedDescription);
            _delegate?.didCatchError(this, error);
          }
          on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        case "didClose":
          _delegate?.didClose(this);
          break;
        case "didRecordImpression":
          _delegate?.didRecordImpression(this);
          break;
        case "didRecordClick":
          _delegate?.didRecordClick(this);
          break;
        case "didExpandedToFullscreen":
          _delegate?.didExpandedToFullscreen(this);
          break;
        case "didCollapsedFromFullscreen":
          _delegate?.didCollapsedFromFullscreen(this);
          break;
        case "adStartPlayingAudio":
          _playbackDelegate?.adStartPlayingAudio(this);
          break;
        case "adStopPlayingAudio":
          _playbackDelegate?.adStopPlayingAudio(this);
          break;
        case "didPlay":
          _playbackDelegate?.didPlay(this);
          break;
        case "didPause":
          _playbackDelegate?.didPause(this);
          break;
        case "didComplete":
          _playbackDelegate?.didComplete(this);
          break;
        default:
          break;
      }
    });
  }

  setDelegate(TeadsAdDelegate delegate) async {
    _delegate = delegate;
    await _channel.invokeMethod('delegate', [requestIdentifier]);
  }

  setPlaybackDelegate(TeadsPlaybackDelegate playbackDelegate) async {
    _playbackDelegate = playbackDelegate;
    await _channel.invokeMethod('playbackDelegate', [requestIdentifier]);
  }

}

class TeadsInReadAd extends TeadsAd {
  TeadsInReadAd(String requestIdentifier) : super(requestIdentifier);
}
