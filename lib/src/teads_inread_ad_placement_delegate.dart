import 'package:teads_sdk_flutter/src/teads_ad_ratio.dart';
import 'package:teads_sdk_flutter/src/teads_inread_ad.dart';

mixin TeadsInReadAdPlacementDelegate {
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio);
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio);
}
