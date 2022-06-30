import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/inread/teads_inread_ad.dart';
import 'package:teads_sdk_flutter/src/teads_ad_placement.dart';
import 'package:teads_sdk_flutter/src/inread/teads_ad_ratio.dart';
import 'package:teads_sdk_flutter/src/teads_ad_request_settings.dart';
import 'package:teads_sdk_flutter/src/teads_errors.dart';

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
    channel.setMethodCallHandler((call) async {
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
    final String id = await channel.invokeMethod('requestAd', [requestSettings.mapValue]);
    inReadAdAdRatioMaps.add(InReadAdAdRatioMap(TeadsInReadAd(id), TeadsAdRatio(id)));
    return id;
  }

}