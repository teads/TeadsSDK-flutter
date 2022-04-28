import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements TeadsInReadAdPlacementDelegate, TeadsAdDelegate, TeadsPlaybackDelegate {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      TeadsAdPlacementSettings placementSettings = TeadsAdPlacementSettings();
      await placementSettings.enableDebug();
      TeadsInReadAdPlacement? placement = await Teads.createInReadPlacement(84242, placementSettings, this);
      TeadsAdRequestSettings requestSettings = TeadsAdRequestSettings();
      await requestSettings.pageUrl("https://example.com");
      await placement?.requestAd(requestSettings);
      platformVersion =
          await Teads.sdkVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: const <Widget>[
              SizedBox(
                height: 400,
                child: TeadsInReadAdView(),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    log('didReceiveAd');
    ad.delegate = this;
    ad.playbackDelegate = this;
  }

  @override
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    log('didUpdateRatio');
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
