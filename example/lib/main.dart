import 'package:flutter/material.dart';
import 'integration_list.dart';
import 'provider_list.dart';

import 'title.dart';
import 'format_list.dart';

import 'creative_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String _test = "test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Container(
            height: 30,
            child: (Image.asset(
                "assets/Teads-Sample-App.imageset/Teads-Sample-App-black.png")),
          ),
          leading: Container(
            height: 30,
            child: (Image.asset("assets/logo.png")),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        const title(giventitle: "Formats"),
        format_list(),
        const title(giventitle: "Providers"),
        provider_list(),
        const title(giventitle: "Creatives"),
        creative_list(),
        const title(giventitle: "Integrations"),
        integration_list()
      ]),
    );
  }
}
