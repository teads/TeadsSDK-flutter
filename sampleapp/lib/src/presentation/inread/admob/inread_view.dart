import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:teads_admob_adapter/teads_admob_adapter.dart';
import 'package:sampleapp/src/models/creative.dart';
import 'package:sampleapp/src/models/format.dart';
import 'package:sampleapp/src/models/integration.dart';
import 'package:sampleapp/src/models/provider.dart';

class InReadAdmob extends StatefulWidget {
  final Format selectedFormat;

  const InReadAdmob({
    Key? key,
    required this.selectedFormat,
  }) : super(key: key);

  @override
  State<InReadAdmob> createState() => _InReadAdmobState();
}

class _InReadAdmobState extends State<InReadAdmob> {
  AdManagerBannerAd? _bannerAd;
  late AdSize _adSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _requestAd();
    });
  }

  @override
  void dispose() {
    super.dispose();
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
        adUnitId: widget.selectedFormat.pid,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: SizedBox(
            height: 30,
            child: (Image.asset(
                "assets/Teads-Sample-App.imageset/Teads-Sample-App-white.png")),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(171, 65, 149, 1),
                  Color.fromRGBO(33, 87, 152, 1)
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color.fromARGB(255, 170, 1, 136),
                      Color.fromARGB(255, 0, 66, 147)
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/coffee_bg.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        widget.selectedFormat.type.value +
                            " " +
                            widget.selectedFormat.provider.type.value +
                            " " +
                            widget.selectedFormat.provider.creativeType.value +
                            " " +
                            widget
                                .selectedFormat.provider.integrationType.value,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Scroll down to see your creative",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15,
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(105, 169, 224, 1),
                        ),
                        child: const Text(
                          "ARTICLE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.6),
                        )),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15,
                ),
                child: const Text(
                  "Creative that cuts through the noise…but respects the user.",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15,
                ),
                child: const Text(
                  "Holding attention in a mobile driven world is no easy challenge. At Teads, we embrace the swipes, the scrolls, the pinches and the taps to build ad experiences that delight the user and deliver business results for brands.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 0.8,
                    fontSize: 18,
                  ),
                ),
              ),
              for (int i = 0; i < 15; i++)
                Container(
                  // fake article
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 232, 232, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(232, 232, 232, 1),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      )),
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                  width: double.infinity,
                ),
              _bannerAd != null ?
              Container(
                alignment: Alignment.center,
                child: AdWidget(ad: _bannerAd!),
                width: _adSize.width.toDouble(),
                height: _adSize.height.toDouble(),
              )
              : const SizedBox.shrink(),
              for (int i = 0; i < 15; i++)
                Container(
                  // fake article
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 232, 232, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(232, 232, 232, 1),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      )),
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                  width: double.infinity,
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
