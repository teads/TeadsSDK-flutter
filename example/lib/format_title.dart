import 'package:flutter/material.dart';

class format_title extends StatefulWidget {
  @override
  State<format_title> createState() => _format_titleState();
}

class _format_titleState extends State<format_title> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Formats"),
    );
  }
}
