import 'package:flutter/material.dart';

class demo_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Container(
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
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
                child: Center(
                  child: Text(
                    "Scroll down to see your creative",
                    style: new TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    padding: new EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15,
                    ),
                    child: Container(
                        padding: new EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(105, 169, 224, 1),
                        ),
                        child: Text(
                          "ARTICLE",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.6),
                        )),
                  ),
                ],
              ),

              Container(
                padding: new EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15,
                ),
                child: Text(
                  "Creative that cuts through the noise…but respects the user.",
                  style: new TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 32,
                  ),
                ),
              ),

              Container(
                padding: new EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15,
                ),
                child: Text(
                  "Holding attention in a mobile driven world is no easy challenge. At Teads, we embrace the swipes, the scrolls, the pinches and the taps to build ad experiences that delight the user and deliver business results for brands.",
                  style: new TextStyle(
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
                      color: Color.fromRGBO(232, 232, 232, 1),
                      border: Border.all(
                        color: Color.fromRGBO(232, 232, 232, 1),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      )),
                  height: 10,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                  width: double.infinity,
                ),

              //add
              Text("ADD"),
              for (int i = 0; i < 15; i++)
                Container(
                  // fake article
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      border: Border.all(
                        color: Color.fromRGBO(232, 232, 232, 1),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      )),
                  height: 10,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                  width: double.infinity,
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
