import 'package:flutter/material.dart';

class demo_main extends StatefulWidget {
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;
  demo_main(
      {Key? key,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<demo_main> createState() => _demo_mainState();
}

class _demo_mainState extends State<demo_main> {
  @override
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
                  children: [
                    Center(
                      child: Text(
                        widget.selectedFormat +
                            " " +
                            widget.selectedProvider +
                            " " +
                            widget.selectedCreative +
                            " " +
                            widget.integrationType,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
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

              //add
              const Text("ADD"),
              widget.selectedCreative == "custom"
                  ? Text("PID :" + widget.selectedPID)
                  : const Text(""),

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
