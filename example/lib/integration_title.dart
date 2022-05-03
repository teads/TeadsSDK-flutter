import 'package:flutter/material.dart';

class integration_title extends StatefulWidget {
  @override
  State<integration_title> createState() => _integration_titleState();
}

class _integration_titleState extends State<integration_title> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          "Integrations",
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
