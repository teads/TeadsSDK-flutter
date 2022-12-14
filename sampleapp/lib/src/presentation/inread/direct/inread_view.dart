import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';
import 'package:sampleapp/src/models/creative.dart';
import 'package:sampleapp/src/models/format.dart';
import 'package:sampleapp/src/models/integration.dart';
import 'package:sampleapp/src/models/provider.dart';

class InReadDirect extends StatefulWidget {
  final Format selectedFormat;

  const InReadDirect({
    Key? key,
    required this.selectedFormat,
  }) : super(key: key);

  @override
  State<InReadDirect> createState() => _InReadDirectState();
}

class _InReadDirectState extends State<InReadDirect>
    implements
        TeadsInReadAdPlacementDelegate,
        TeadsAdDelegate,
        TeadsPlaybackDelegate {
  TeadsInReadAdView inReadAdView = TeadsInReadAdView();
  double adViewHeight = 0;
  TeadsInReadAdPlacement? placement;

  @override
  void initState() {
    super.initState();
    initTeadsAd();
  }

  @override
  void dispose() {
    super.dispose();
    inReadAdView.clean();
  }

  Future<void> initTeadsAd() async {
    TeadsAdPlacementSettings placementSettings = TeadsAdPlacementSettings();
    await placementSettings.enableDebug();
    placement = await Teads.createInReadPlacement(
        int.parse(widget.selectedFormat.pid), placementSettings, this);
    TeadsAdRequestSettings requestSettings = TeadsAdRequestSettings();
    await requestSettings.pageUrl("https://example.com");
    await placement?.requestAd(requestSettings);

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
              SizedBox(
                height: adViewHeight,
                child: inReadAdView,
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
            ],
          ),
        ),
      ]),
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
    ad.setDelegate(this);
    ad.setPlaybackDelegate(this);
    inReadAdView.bind(ad);
    resizeAd(adRatio);
  }

  @override
  void didUpdateRatio(TeadsInReadAd ad, TeadsAdRatio adRatio) {
    resizeAd(adRatio);
  }

  @override
  void didFailToReceiveAd(String reason) {
    adViewHeight = 0;
  }

  @override
  void didCatchError(TeadsAd ad, Error error) {
    adViewHeight = 0;
  }

  @override
  void didClose(TeadsAd ad) {
    adViewHeight = 0;
  }

  @override
  void adStartPlayingAudio(TeadsAd ad) {}

  @override
  void adStopPlayingAudio(TeadsAd ad) {}

  @override
  void didCollapsedFromFullscreen(TeadsAd ad) {}

  @override
  void didComplete(TeadsAd ad) {}

  @override
  void didExpandedToFullscreen(TeadsAd ad) {}

  @override
  void didPause(TeadsAd ad) {}

  @override
  void didPlay(TeadsAd ad) {}

  @override
  void didRecordClick(TeadsAd ad) {}

  @override
  void didRecordImpression(TeadsAd ad) {}
}
