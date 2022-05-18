import 'dart:developer';

import 'package:flutter/material.dart';
import 'demo_main.dart';

class integration_list extends StatefulWidget {
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;
  integration_list(
      {Key? key,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<integration_list> createState() => _integration_listState();
}

class _integration_listState extends State<integration_list> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const SizedBox(width: 20),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(170, 184, 205, 1)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    )),
                child: Column(children: [
                  IconButton(
                    icon: Image.asset(
                        "assets/ScrollView.imageset/ScrollView150.png"),
                    iconSize: 100,
                    onPressed: () {
                      setState(() {
                        widget.integrationType = "scrollView";
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => demo_main(
                              integrationType: widget.integrationType,
                              selectedProvider: widget.selectedProvider,
                              selectedCreative: widget.selectedCreative,
                              selectedFormat: widget.selectedFormat,
                              selectedPID: widget.selectedPID),
                        ),
                      );
                    },
                  ),
                  const Text(
                    "ScrollView",
                    style: TextStyle(
                      color: Color.fromRGBO(170, 184, 205, 1),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(170, 184, 205, 1)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    )),
                child: Column(children: [
                  IconButton(
                    icon: Image.asset(
                        "assets/CollectionView.imageset/CollectionView150.png"),
                    iconSize: 100,
                    onPressed: () {
                      setState(() {
                        widget.integrationType = "collectionView";
                      });
                      log(widget.selectedFormat);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => demo_main(
                              integrationType: widget.integrationType,
                              selectedProvider: widget.selectedProvider,
                              selectedCreative: widget.selectedCreative,
                              selectedFormat: widget.selectedFormat,
                              selectedPID: widget.selectedPID),
                        ),
                      );
                    },
                  ),
                  const Text(
                    "CollectionView",
                    style: TextStyle(
                      color: Color.fromRGBO(170, 184, 205, 1),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(170, 184, 205, 1)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  )),
              child: Column(children: [
                IconButton(
                  icon:
                      Image.asset("assets/TableView.imageset/TableView150.png"),
                  iconSize: 100,
                  onPressed: () {
                    setState(() {
                      widget.integrationType = "tableView";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => demo_main(
                            integrationType: widget.integrationType,
                            selectedProvider: widget.selectedProvider,
                            selectedCreative: widget.selectedCreative,
                            selectedFormat: widget.selectedFormat,
                            selectedPID: widget.selectedPID),
                      ),
                    );
                  },
                ),
                const Text(
                  "TableView",
                  style: TextStyle(color: Color.fromRGBO(170, 184, 205, 1)),
                ),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(170, 184, 205, 1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  )),
              child: Column(children: [
                IconButton(
                  icon: Image.asset("assets/WebView.imageset/WebView150.png"),
                  iconSize: 100,
                  onPressed: () {
                    setState(() {
                      widget.integrationType = "webView";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => demo_main(
                            integrationType: widget.integrationType,
                            selectedProvider: widget.selectedProvider,
                            selectedCreative: widget.selectedCreative,
                            selectedFormat: widget.selectedFormat,
                            selectedPID: widget.selectedPID),
                      ),
                    );
                  },
                ),
                const Text(
                  "Webview",
                  style: TextStyle(
                    color: Color.fromRGBO(170, 184, 205, 1),
                  ),
                ),
              ]),
            ),
          ]),
        ],
      ),
    );
  }
}
