import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

mixin TeadsInReadAdPlacementDelegate {
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio);
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio);
}
