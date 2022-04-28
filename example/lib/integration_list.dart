import 'package:flutter/material.dart';

class integration_list extends StatefulWidget {
  @override
  State<integration_list> createState() => _integration_listState();
}

class _integration_listState extends State<integration_list> {
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
                            IconButton(
                              icon: Image.asset(
                                  "assets/ScrollView.imageset/ScrollView150.png"),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                  "assets/CollectionView.imageset/CollectionView150.png"),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                  "assets/TableView.imageset/TableView150.png"),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                  "assets/WebView.imageset/WebView150.png"),
                              iconSize: 50,
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ))));
  }
}
