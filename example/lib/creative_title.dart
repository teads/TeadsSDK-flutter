import 'package:flutter/material.dart';

class creative_title extends StatefulWidget {
  @override
  State<creative_title> createState() => _creative_titleState();
}

class _creative_titleState extends State<creative_title> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          "Creatives",
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
