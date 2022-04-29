import 'package:flutter/material.dart';

class integration_list extends StatefulWidget {
  @override
  State<integration_list> createState() => _integration_listState();
}

class _integration_listState extends State<integration_list> {
  String _integrationType = "ScrollView";

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
                    SizedBox(height: 10),
                    IconButton(
                      icon: Image.asset(
                          "assets/ScrollView.imageset/ScrollView150.png"),
                      iconSize: 100,
                      onPressed: () {
                        setState(() {
                          _integrationType = "ScrollView";
                        });
                      },
                    ),
                    Text("ScrollView"),
                    SizedBox(height: 10),
                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      )),
                  child: Column(children: [
                    SizedBox(height: 10),
                    IconButton(
                      icon: Image.asset(
                          "assets/CollectionView.imageset/CollectionView150.png"),
                      iconSize: 100,
                      onPressed: () {
                        setState(() {
                          _integrationType = "CollectionView";
                        });
                      },
                    ),
                    Text("CollectionView"),
                    SizedBox(height: 10),
                  ]),
                ),
              ],
            ),
            SizedBox(width: 50),
            Column(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    )),
                child: Column(children: [
                  SizedBox(height: 10),
                  IconButton(
                    icon: Image.asset(
                        "assets/TableView.imageset/TableView150.png"),
                    iconSize: 100,
                    onPressed: () {
                      setState(() {
                        _integrationType = "TableView";
                      });
                    },
                  ),
                  Text("TableView"),
                  SizedBox(height: 10),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    )),
                child: Column(children: [
                  SizedBox(height: 10),
                  IconButton(
                    icon: Image.asset("assets/WebView.imageset/WebView150.png"),
                    iconSize: 100,
                    onPressed: () {
                      setState(() {
                        _integrationType = "WebView";
                      });
                    },
                  ),
                  Text("Webview"),
                  SizedBox(height: 10),
                ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
