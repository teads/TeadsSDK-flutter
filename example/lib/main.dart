import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/ProvidersTitle.dart';
import 'FormatTitle.dart';
import 'formats.dart';
import 'CreativeTitle.dart';
import 'IntegrationTitle.dart';
import 'ProvidersTitle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text("SampleApp Flutter"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 137, 24, 79),
                  Color.fromARGB(255, 33, 86, 243),
                ],
              ),
            ),
          ),
        ),
        FormatTitle(),
        formats(),
        CreativeTitle(),
        formats(),
        ProvidersTitle(),
        formats(),
        IntegrationTitle(),
        formats(),
      ]),
    );
  }
}
