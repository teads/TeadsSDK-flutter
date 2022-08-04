import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter/teads_sdk_flutter.dart';
import 'package:teads_sdk_flutter_example/src/models/creative.dart';
import 'package:teads_sdk_flutter_example/src/models/format.dart';
import 'package:teads_sdk_flutter_example/src/models/integration.dart';
import 'package:teads_sdk_flutter_example/src/models/provider.dart';
import 'package:teads_sdk_flutter_example/src/presentation/infeed_native/in_feed_native_list_item.dart';

class DemoNative extends StatefulWidget {
  final Format selectedFormat;

  const DemoNative({
    Key? key,
    required this.selectedFormat,
  }) : super(key: key);

  @override
  State<DemoNative> createState() => _DemoNativeState();
}

class _DemoNativeState extends State<DemoNative>
    implements TeadsNativeAdPlacementDelegate {
  TeadsNativeAdView nativeAdView =
      TeadsNativeAdView(factoryId: 'exampleNativeAd');
  double adViewHeight = 0;
  TeadsNativeAdPlacement? placement;

  @override
  void initState() {
    super.initState();
    initTeadsAd();
  }

  Future<void> initTeadsAd() async {
    TeadsAdPlacementSettings placementSettings = TeadsAdPlacementSettings();
    await placementSettings.enableDebug();
    placement = await Teads.createNativePlacement(
        int.parse(widget.selectedFormat.pid), placementSettings, this);
    TeadsAdRequestSettings requestSettings = TeadsAdRequestSettings();
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
              const InFeedDemo(
                source: "@nytimes",
                icon:
                    'https://www.theminotvoice.com/wp-content/uploads/sites/2/2016/10/NYT-icon.png',
                media:
                    'https://static01.nyt.com/images/2021/12/17/arts/16spider-man-review/merlin_199080312_33263efe-93b3-432c-84ca-6e040624dfdf-superJumbo.jpg?quality=75&auto=webp',
                text:
                    'In the latest installment of the Spider-Man series, Tom Holland faces the past and a very secure franchise future.',
                title: "'Spider-Man: No Way Home' Review",
                time: "5",
                textButton: "Follow",
              ),
              const InFeedDemo(
                source: "@wsj",
                icon:
                    'https://play-lh.googleusercontent.com/eksxaPfxbTVb6VTl5aj1sXLpKc_N9Z6AZ3_5Oq6JhTXmgEQza-1v58a66p_ID0phE2Zv',
                media:
                    'https://images.wsj.net/im-452042?width=860&size=1.5&pixel_ratio=2',
                text:
                    'Once gas-powered engines are banned, how will Porsche keep its lucrative club-racing business alive? The Mission R is a first stab at the answer.',
                title: "Porsche Mission R: The All-Electric Future of Racing?",
                time: "7",
                textButton: "Follow",
              ),
              const InFeedDemo(
                source: "@ign",
                icon:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrPAc5tHzqDURqjTaA9Ud_28G37V4Tbch060AubCB6TeNvarlHG5yWSujrNx-uk4du2ic&usqp=CAU',
                media:
                    'https://static.bandainamcoent.eu/high/elden-ring/elden-ring/00-page-setup/elden-ring-new-header-mobile.jpg',
                text:
                    'The Elden Ring was broken. But by whom? And why? Mysteries abound in the latest cinematic trailer for the hotly anticipated Elden Ring.',
                title:
                    "New Elden Ring Trailer Premieres Brand New Cinematic Story Trailer",
                time: "12",
                textButton: "Follow",
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: 400,
                        child: nativeAdView,
                      ))),
              const InFeedDemo(
                source: "@espn",
                icon:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrPAc5tHzqDURqjTaA9Ud_28G37V4Tbch060AubCB6TeNvarlHG5yWSujrNx-uk4du2ic&usqp=CAU',
                media:
                    'https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2021%2F1212%2Fr950038_1296x729_16%2D9.jpg&w=1140&cquality=40&format=jpg',
                text:
                    'In a season full of drama and controversy, it almost feels fitting the championship title was decided on the final lap of the Abu Dhabi Grand Prix.',
                title:
                    "How Max Verstappen won the controversial Abu Dhabi Grand Prix",
                time: "15",
                textButton: "Follow",
              ),
              const InFeedDemo(
                source: "@vice",
                icon:
                    'https://marketingreport.eu/Article%20Images/Key%20Logos/Vice.jpg',
                media:
                    'https://video-images.vice.com/articles/61b9e2eb528aa2009b8c1317/lede/1639582658924-album-2.jpeg?crop=1xw:1xh;center,center&resize=1800:*',
                text:
                    'Will Olivia Rodrigo spark intergenerational warfare? Or will Kanye get the thumbs up from all three year groups?',
                title:
                    "A Boomer, Millennial and Zoomer Argue Over Their Music of the Year",
                time: "16",
                textButton: "Follow",
              ),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  void didReceiveAd(TeadsNativeAd ad) {
    nativeAdView.bind(ad);
    adViewHeight = 400;
  }

  @override
  void didFailToReceiveAd(String reason) {
    adViewHeight = 0;
  }
}
