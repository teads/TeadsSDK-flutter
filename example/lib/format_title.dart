import 'package:flutter/material.dart';

class format_title extends StatefulWidget {
  @override
  State<format_title> createState() => _format_titleState();
}

class _format_titleState extends State<format_title> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          "Formats",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
