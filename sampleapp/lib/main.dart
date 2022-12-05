import 'package:flutter/material.dart';
import 'package:sampleapp/src/presentation/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
