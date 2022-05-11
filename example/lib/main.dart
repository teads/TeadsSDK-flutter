import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    TeadsAdPlacementSettings adPlacementSettings = TeadsAdPlacementSettings();

    await adPlacementSettings.enableDebug();
    log(adPlacementSettings.mapValue.toString());

    Teads.createInReadPlacement(84242, adPlacementSettings, null);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Row(
            children: [Text("test")],
          ),
        ),
      ),
    );
  }
}
