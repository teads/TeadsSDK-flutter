import 'package:flutter/material.dart';

class provider_list extends StatefulWidget {
  @override
  State<provider_list> createState() => _provider_listState();
}

class _provider_listState extends State<provider_list> {
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
                                child: const Text('Direct')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Admob')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Mopub')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Smart')),
                          ],
                        )
                      ],
                    ))));
  }
}
