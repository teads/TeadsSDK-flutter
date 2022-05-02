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
                  Color.fromARGB(255, 185, 97, 232),
                  Color.fromARGB(255, 74, 52, 238)
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
                        Color.fromARGB(255, 185, 97, 232),
                        Color.fromARGB(255, 74, 52, 238)
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/coffee_bg.png"),
                      fit: BoxFit.cover,
                      opacity: 0.7,
                    ),
                  ),
                  child: Center(
                    child: Text("Scroll down to see your creative",
                        style: new TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
