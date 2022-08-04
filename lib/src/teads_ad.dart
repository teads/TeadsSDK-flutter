import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_errors.dart';

mixin TeadsAdDelegate {
  // When the ad experience has experienced an issue
  void didCatchError(TeadsAd ad, FlutterError error);

  // When the ad has been closed
  void didClose(TeadsAd ad);

  // When an impression has occured
  void didRecordImpression(TeadsAd ad);

  // When an event click has been fired
  void didRecordClick(TeadsAd ad);

  // When the ad goes to fullscreen
  void didExpandedToFullscreen(TeadsAd ad);

  // When the ad collapse from fullscreen
  void didCollapsedFromFullscreen(TeadsAd ad);
}

mixin TeadsPlaybackDelegate {
  // When the ad has started playing audio
  void adStartPlayingAudio(TeadsAd ad);

  // When the ad has stopped playing audio
  void adStopPlayingAudio(TeadsAd ad);

  // When the ad has started playing
  void didPlay(TeadsAd ad);

  // When the ad has stopped playing
  void didPause(TeadsAd ad);

  // When the ad has complete
  void didComplete(TeadsAd ad);
}

class TeadsAd {
  final MethodChannel _channel =
      const MethodChannel('teads_sdk_flutter/teads_ad');

  @protected
  MethodChannel get channel => _channel;

  TeadsAdDelegate? _delegate;
  TeadsPlaybackDelegate? _playbackDelegate;
  String requestIdentifier;

  TeadsAd(this.requestIdentifier) {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didCatchError":
          try {
            final String errorLocalizedDescription = call.arguments[1];
            FlutterError error = FlutterError(errorLocalizedDescription);
            _delegate?.didCatchError(this, error);
          } on StateError {
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
    await channel.invokeMethod('delegate', [requestIdentifier]);
  }

  setPlaybackDelegate(TeadsPlaybackDelegate playbackDelegate) async {
    _playbackDelegate = playbackDelegate;
    await channel.invokeMethod('playbackDelegate', [requestIdentifier]);
  }
}
