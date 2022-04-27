import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad_ratio.dart';
import 'package:teads_sdk_flutter/src/teads_inread_ad.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements TeadsInReadAdPlacementDelegate {
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
          title: const Text('Plugin Use Sample App'),
        ),
        body: Center(
          child: Text('Running on:  $_platformVersion\n'),
        ),
      ),
    );
  }

  @override
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    // TODO: implement didReceiveAd
  }

  @override
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    // TODO: implement didUpdateRatio
  }
}
