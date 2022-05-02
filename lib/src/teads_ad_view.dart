import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:teads_sdk_flutter/src/teads_ad.dart';

class TeadsInReadAdView extends StatefulWidget {

  final _TeadsInReadAdViewState state = _TeadsInReadAdViewState();

  TeadsInReadAdView({Key? key}) : super(key: key);

  @override
  State<TeadsInReadAdView> createState() => _TeadsInReadAdViewState();

  void bind(TeadsInReadAd ad) {
    state.bind(ad);
  }
}

class _TeadsInReadAdViewState extends State<TeadsInReadAdView> {

  final MethodChannel _channel = const MethodChannel('teads_sdk_flutter/teads_ad_view');
  TeadsInReadAd? inReadAd;

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'FLTTeadsInReadAdView';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  void bind(TeadsInReadAd ad) async {
    inReadAd = ad;
    await _channel.invokeMethod('bind', [ad.requestIdentifier]);
  }

}
