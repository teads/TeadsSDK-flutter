import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_inread_ad_placement.dart';

mixin TeadsAdDelegate {
  void willPresentModalView(TeadsAd ad);
  void didCatchError(TeadsAd ad, Error error);
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
  TeadsInReadAdPlacement adPlacement;

  TeadsAd(this.requestIdentifier, this.adPlacement) {
    _channel.setMethodCallHandler((call) async {
      if (adPlacement.teadsAd != null) {

        switch(call.method) {
          case "willPresentModalView":
            _delegate?.willPresentModalView(adPlacement.teadsAd as TeadsAd);
            break;
          case "didCatchError":
            _delegate?.didCatchError(adPlacement.teadsAd as TeadsAd, Error());
            break;
          case "didClose":
            _delegate?.didClose(adPlacement.teadsAd as TeadsAd);
            break;
          case "didRecordImpression":
            _delegate?.didRecordImpression(adPlacement.teadsAd as TeadsAd);
            break;
          case "didRecordClick":
            _delegate?.didRecordClick(adPlacement.teadsAd as TeadsAd);
            break;
          case "didExpandedToFullscreen":
            _delegate?.didExpandedToFullscreen(adPlacement.teadsAd as TeadsAd);
            break;
          case "didCollapsedFromFullscreen":
            _delegate?.didCollapsedFromFullscreen(adPlacement.teadsAd as TeadsAd);
            break;
          case "adStartPlayingAudio":
            _playbackDelegate?.adStartPlayingAudio(adPlacement.teadsAd as TeadsAd);
            break;
          case "adStopPlayingAudio":
            _playbackDelegate?.adStopPlayingAudio(adPlacement.teadsAd as TeadsAd);
            break;
          case "didPlay":
            _playbackDelegate?.didPlay(adPlacement.teadsAd as TeadsAd);
            break;
          case "didPause":
            _playbackDelegate?.didPause(adPlacement.teadsAd as TeadsAd);
            break;
          case "didComplete":
            _playbackDelegate?.didComplete(adPlacement.teadsAd as TeadsAd);
            break;
          default:
            break;
        }
      }
    });
  }

  setDelegate(TeadsAdDelegate delegate) async {
    _delegate = delegate;
    await _channel.invokeMethod('delegate');
  }

  setPlaybackDelegate(TeadsPlaybackDelegate playbackDelegate) async {
    _playbackDelegate = playbackDelegate;
    await _channel.invokeMethod('playbackDelegate');
  }

}

class TeadsInReadAd extends TeadsAd {
  TeadsInReadAd(String requestIdentifier, TeadsInReadAdPlacement adPlacement) : super(requestIdentifier, adPlacement);
}
