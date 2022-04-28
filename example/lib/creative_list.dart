import 'package:flutter/material.dart';

class creative_list extends StatefulWidget {
  @override
  State<creative_list> createState() => _creative_listState();
}

class _creative_listState extends State<creative_list> {
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
                                child: const Text('LandScape')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Vertical')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Square')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Carousel')),
                            TextButton(
                                onPressed: _ButtonFunction,
                                child: const Text('Custom')),
                          ],
                        )
                      ],
                    ))));
  }
}
