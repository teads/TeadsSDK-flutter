import 'package:flutter/material.dart';

class format_list extends StatefulWidget {
  @override
  State<format_list> createState() => _format_listState();
}

class _format_listState extends State<format_list> {
  bool _isPressed = false;

  void _ButtonFunction() {
    setState(() {
      if (_isPressed) {
        _isPressed = false;
        print(_isPressed);
      } else {
        _isPressed = true;
        print(_isPressed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int items = 1;
    return SliverToBoxAdapter(
        child: SizedBox(
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items,
                itemBuilder: (context, item) => Stack(
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('InReads')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Native')),
                          ],
                        )
                      ],
                    ))));
  }
}
