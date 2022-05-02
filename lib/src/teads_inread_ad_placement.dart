import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

class InReadAdAdRatioMap {
  TeadsInReadAd inReadAd;
  TeadsAdRatio adRatio;
  InReadAdAdRatioMap(this.inReadAd, this.adRatio);
}

class TeadsInReadAdPlacement {

  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_inread_ad_placement');

  TeadsInReadAdPlacementDelegate? delegate;
  List<InReadAdAdRatioMap> inReadAdAdRatioMaps = [];

  TeadsInReadAdPlacement(this.delegate) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "didReceiveAd":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap = inReadAdAdRatioMaps.firstWhere((element) => element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didReceiveAd(inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          }
          on StateError {
            // code for handling exception
          }
          break;
        case "didUpdateRatio":
          try {
            final String requestIdentifier = call.arguments[0];
            InReadAdAdRatioMap inReadAdAdRatioMap = inReadAdAdRatioMaps.firstWhere((element) => element.inReadAd.requestIdentifier == requestIdentifier);
            delegate?.didUpdateRatio(inReadAdAdRatioMap.inReadAd, inReadAdAdRatioMap.adRatio);
          }
          on StateError {
            // code for handling exception
          }
          break;
        default:
          break;
      }
    });
  }

  Future<String> requestAd(TeadsAdRequestSettings requestSettings) async {
    final String id = await _channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    inReadAdAdRatioMaps.add(InReadAdAdRatioMap(TeadsInReadAd(id), TeadsAdRatio(id)));
    return id;
  }
}
