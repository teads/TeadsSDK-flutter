import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

mixin TeadsAdPlacementDelegate {
  void didFailToReceiveAd(String reason); // TODO AdFailReason type
  void adOpportunityTrackerView(String trackerView); // TODO TeadsAdOpportunityTrackerView
}

abstract class TeadsAdPlacement {

  final MethodChannel _channel;
  TeadsAdPlacementDelegate? delegate;

  TeadsAdPlacement(this.delegate, this._channel) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didFailToReceiveAd":
          delegate?.didFailToReceiveAd("");
          break;
        case "adOpportunityTrackerView":
          delegate?.adOpportunityTrackerView("");
          break;
        default:
          break;
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings);
}

//////////////////////////
//// InRead Placement ////
//////////////////////////

class InReadAdAdRatioMap {
  TeadsInReadAd inReadAd;
  TeadsAdRatio adRatio;
  InReadAdAdRatioMap(this.inReadAd, this.adRatio);
}

mixin TeadsInReadAdPlacementDelegate implements TeadsAdPlacementDelegate {
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio);
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio);
}

class TeadsInReadAdPlacement extends TeadsAdPlacement {

  List<InReadAdAdRatioMap> inReadAdAdRatioMaps = [];

  TeadsInReadAdPlacement(TeadsInReadAdPlacementDelegate? delegate) : super(delegate, const MethodChannel('teads_sdk_flutter/teads_ad_placement/inread')) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap = inReadAdAdRatioMaps.firstWhere((element) => element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didReceiveAd(inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          }
          on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        case "didUpdateRatio":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap = inReadAdAdRatioMaps.firstWhere((element) => element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didUpdateRatio(inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          }
          on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id = await _channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    inReadAdAdRatioMaps.add(InReadAdAdRatioMap(TeadsInReadAd(id), TeadsAdRatio(id)));
    return id;
  }

}

//////////////////////////
//// Native Placement ////
//////////////////////////

mixin TeadsNativeAdPlacementDelegate implements TeadsAdPlacementDelegate {
  void didReceiveAd(TeadsNativeAd ad);
}

class TeadsNativeAdPlacement extends TeadsAdPlacement {

  List<TeadsNativeAd> nativeAds = [];

  TeadsNativeAdPlacement(TeadsNativeAdPlacementDelegate? delegate) : super(delegate, const MethodChannel('teads_sdk_flutter/teads_ad_placement/native')) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            TeadsNativeAd nativeAd = nativeAds.firstWhere((element) => element.requestIdentifier == requestIdentifier);
            delegate?.didReceiveAd(nativeAd);
          }
          on StateError {
            throw Exception(badArgumentsErrorMessage);
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id = await _channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    nativeAds.add(TeadsNativeAd(id));
    return id;
  }
}
