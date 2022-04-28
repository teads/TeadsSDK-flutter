import 'package:flutter/material.dart';

class provider_title extends StatefulWidget {
  @override
  State<provider_title> createState() => _provider_titleState();
}

class _provider_titleState extends State<provider_title> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Providers"),
    );
  }
}
