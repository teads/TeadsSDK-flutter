import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Teads InRead Ads Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InRead(title: title),
    );
  }
}

class InRead extends StatefulWidget {
  const InRead({super.key, required this.title});

  final String title;

  @override
  State<InRead> createState() => _InReadState();
}

class _InReadState extends State<InRead> implements TeadsInReadAdPlacementDelegate {
  final TeadsInReadAdView _inReadAdView = TeadsInReadAdView();
  TeadsInReadAdPlacement? _placement;
  double _adViewHeight = 0;
  final int _pid = 84242; // This is a test PID

  @override
  void initState() {
    super.initState();
    _initTeadsAd();
  }

  @override
  void dispose() {
    super.dispose();
    // Release memory object on activity/controller allocation
    _inReadAdView.clean();
  }

  Future<void> _initTeadsAd() async {
    TeadsAdPlacementSettings placementSettings = TeadsAdPlacementSettings();
    await placementSettings.enableDebug();
    _placement = await Teads.createInReadPlacement(_pid, placementSettings, this);
  }

  void _requestAd() async {
    TeadsAdRequestSettings requestSettings = TeadsAdRequestSettings();
    await _placement?.requestAd(requestSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: _adViewHeight,
        child: _inReadAdView,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestAd,
        tooltip: 'Request',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _resizeAd(TeadsAdRatio adRatio) async {
    double width = MediaQuery.of(context).size.width;
    double height = await adRatio.calculateHeight(width);

    setState(() {
      _adViewHeight = height;
    });
  }

  @override
  void didFailToReceiveAd(String reason) {
    print("Fail to receive ad with reason: $reason");
    setState(() {
      _adViewHeight = 0;
    });
  }

  @override
  void didReceiveAd(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    _inReadAdView.bind(ad);
    _resizeAd(adRatio);
  }

  @override
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    _resizeAd(adRatio);
  }
}
