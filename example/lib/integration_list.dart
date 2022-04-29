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
    return SliverToBoxAdapter(
        child: Container(
            child: Row(
      children: [
        SizedBox(width: 50),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              child: Column(children: [
                SizedBox(height: 10, width: 50),
                IconButton(
                  icon: Image.asset(
                      "assets/ScrollView.imageset/ScrollView150.png"),
                  iconSize: 100,
                  onPressed: () {},
                ),
                Text("ScrollView"),
                SizedBox(height: 10),
              ]),
            ),
            IconButton(
              icon: Image.asset(
                  "assets/CollectionView.imageset/CollectionView150.png"),
              iconSize: 100,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(width: 50),
        Column(children: [
          SizedBox(height: 10),
          IconButton(
            icon: Image.asset("assets/TableView.imageset/TableView150.png"),
            iconSize: 100,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          IconButton(
            icon: Image.asset("assets/WebView.imageset/WebView150.png"),
            iconSize: 100,
            onPressed: () {},
          )
        ]),
      ],
    )));
  }
}
