import 'package:flutter/material.dart';

class provider_title extends StatefulWidget {
  @override
  State<provider_title> createState() => _provider_titleState();
}

class _provider_titleState extends State<provider_title> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          "Providers",
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
