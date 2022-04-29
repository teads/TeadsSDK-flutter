import 'package:flutter/material.dart';
import 'integration_list.dart';
import 'provider_list.dart';
import 'provider_title.dart';
import 'format_title.dart';
import 'format_list.dart';
import 'creative_title.dart';
import 'creative_list.dart';
import 'integration_title.dart';

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
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255)
                ],
              ),
            ),
          ),
        ),
        format_title(),
        format_list(),
        provider_title(),
        provider_list(),
        creative_title(),
        creative_list(),
        integration_title(),
        integration_list()
      ]),
    );
  }
}
