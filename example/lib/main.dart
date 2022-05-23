import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teads Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Teads Demo'),
    );
  }
}


class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements TeadsInReadAdPlacementDelegate, TeadsAdDelegate, TeadsPlaybackDelegate {
  TeadsInReadAdView inReadAdView = TeadsInReadAdView();
  double adViewHeight = 0;
  TeadsInReadAdPlacement? placement;
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut labore et dolore "
      "magna aliqua. Ut enim ad minim veniam, quis nostrud "
      "exercitation ullamco laboris nisi ut aliquip ex ea "
      "commodo consequat. Duis aute irure dolor in reprehenderit "
      "in voluptate velit esse cillum dolore eu fugiat nulla "
      "pariatur. Excepteur sint occaecat cupidatat non proident, "
      "sunt in culpa qui officia deserunt mollit anim id est "
      "laborum.";

  @override
  void initState() {
    super.initState();
    initTeadsAd();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initTeadsAd() async {
    TeadsAdPlacementSettings placementSettings = TeadsAdPlacementSettings();
    await placementSettings.enableDebug();
    placement = await Teads.createInReadPlacement(127546, placementSettings, this);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                TeadsAdRequestSettings requestSettings = TeadsAdRequestSettings();
                await requestSettings.pageUrl("https://example.com");
                await placement?.requestAd(requestSettings);
              },
              child: const Text('Load ad'),
            ),
            Text(loremIpsum + loremIpsum + loremIpsum + loremIpsum),
            SizedBox(
              height: adViewHeight,
              child: inReadAdView,
            ),
            Text(loremIpsum + loremIpsum + loremIpsum + loremIpsum)
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void resizeAd(TeadsAdRatio adRatio) async {
    double width = MediaQuery.of(context).size.width;
    double height = await adRatio.calculateHeight(width);

    setState(() {
      adViewHeight = height;
    });
  }

  @override
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    log('didReceiveAd');
    ad.setDelegate(this);
    ad.setPlaybackDelegate(this);
    inReadAdView.bind(ad);
    resizeAd(adRatio);
  }

  @override
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    log('didUpdateRatio');
    resizeAd(adRatio);
  }

  @override
  void adOpportunityTrackerView(String trackerView) {
    log('adOpportunityTrackerView');
  }

  @override
  void didFailToReceiveAd(String reason) {
    log('didFailToReceiveAd');
  }

  @override
  void willPresentModalView(TeadsAd ad) {
    log('willPresentModalView');
  }

  @override
  void adStartPlayingAudio(TeadsAd ad) {
    log('adStartPlayingAudio');
  }

  @override
  void adStopPlayingAudio(TeadsAd ad) {
    log('adStopPlayingAudio');
  }

  @override
  void didCatchError(TeadsAd ad, Error error) {
    log('didCatchError');
  }

  @override
  void didClose(TeadsAd ad) {
    log('didClose');
  }

  @override
  void didCollapsedFromFullscreen(TeadsAd ad) {
    log('didCollapsedFromFullscreen');
  }

  @override
  void didComplete(TeadsAd ad) {
    log('didComplete');
  }

  @override
  void didExpandedToFullscreen(TeadsAd ad) {
    log('didExpandedToFullscreen');
  }

  @override
  void didPause(TeadsAd ad) {
    log('didPause');
  }

  @override
  void didPlay(TeadsAd ad) {
    log('didPlay');
  }

  @override
  void didRecordClick(TeadsAd ad) {
    log('didRecordClick');
  }

  @override
  void didRecordImpression(TeadsAd ad) {
    log('didRecordImpression');
  }
}