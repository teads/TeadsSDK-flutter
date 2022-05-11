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

class TeadsNativeAd extends TeadsAd {
  TeadsNativeAd(String requestIdentifier) : super(requestIdentifier);

  String? _title;
  String? _content;
  String? _image;
  String? _icon;
  String? _sponsored;
  String? _callToAction;
  String? _video;
  String? _rating;
  String? _price;
  String? _adChoices;

  Future<void> register(String containerView) async {
    await _channel.invokeMethod('register', [containerView]);
  }

  Future<String?> get title async {
    _title = await _channel.invokeMethod('title');
    return _title;
  }

  Future<String?> get content async {
    _content = await _channel.invokeMethod('content');
    return _content;
  }

  Future<String?> get image async {
    _image = await _channel.invokeMethod('image');
    return _image;
  }

  Future<String?> get icon async {
    _icon = await _channel.invokeMethod('icon');
    return _icon;
  }

  Future<String?> get sponsored async {
    _sponsored = await _channel.invokeMethod('sponsored');
    return _sponsored;
  }

  Future<String?> get callToAction async {
    _callToAction = await _channel.invokeMethod('callToAction');
    return _callToAction;
  }

  Future<String?> get video async {
    _video = await _channel.invokeMethod('video');
    return _video;
  }

  Future<String?> get rating async {
    _rating = await _channel.invokeMethod('rating');
    return _rating;
  }

  Future<String?> get price async {
    _price = await _channel.invokeMethod('price');
    return _price;
  }

  Future<String?> get adChoices async {
    _adChoices = await _channel.invokeMethod('adChoices');
    return _adChoices;
  }
}
