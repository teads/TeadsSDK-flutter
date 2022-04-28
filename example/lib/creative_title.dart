import 'package:flutter/material.dart';

class creative_title extends StatefulWidget {
  @override
  State<creative_title> createState() => _creative_titleState();
}

class _creative_titleState extends State<creative_title> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Creatives"),
    );
  }
}
