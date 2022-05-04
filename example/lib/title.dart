import 'package:flutter/material.dart';

class title extends StatelessWidget {
  const title({
    Key? key,
    required this.giventitle,
  }) : super(key: key);

  final String giventitle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          giventitle,
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
