import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:teads_admob_adapter/teads_admob_adapter.dart';

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

class _InReadState extends State<InRead> {
  AdManagerBannerAd? _bannerAd;
  late AdSize _adSize;
  final String _adUnit = "ca-app-pub-3068786746829754/2411019030"; // This is a test PID

  @override
  void dispose() {
    super.dispose();
    // Release memory object on activity/controller allocation
    _bannerAd?.dispose();
  }

  Future<void> _requestAd() async {
    AdManagerAdRequest request = const AdManagerAdRequest(mediationExtrasIdentifier: "Teads");
    TeadsAdapterSettings settings = TeadsAdapterSettings();
    await settings.enableDebug();
    double width = MediaQuery.of(context).size.width;
    _adSize = AdSize(width: width.toInt(), height: width ~/ (16/9));
    setState(() {
      _bannerAd = AdManagerBannerAd(
        sizes: [_adSize],
        adUnitId: _adUnit,
        request: request,
        listener: AdManagerBannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) => print('Ad opened.'),
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) => print('Ad closed.'),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ),
      );
      _bannerAd?.load();
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  Widget BannerAdWidget() {
      if (_bannerAd != null) {
        return Container(
          alignment: Alignment.center,
          width: _adSize.width.toDouble(),
          height: _adSize.height.toDouble(),
          child: AdWidget(ad: _bannerAd!),
        );
      } else {
        return const SizedBox.shrink();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BannerAdWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestAd,
        tooltip: 'Request',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
