import 'package:flutter/material.dart';

class integration_title extends StatefulWidget {
  @override
  State<integration_title> createState() => _integration_titleState();
}

class _integration_titleState extends State<integration_title> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Integrations"),
    );
  }
}
