// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/demo_native.dart';

class IntegrationListNative extends StatefulWidget {
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;
  IntegrationListNative(
      {Key? key,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<IntegrationListNative> createState() => _IntegrationListNativeState();
}

class _IntegrationListNativeState extends State<IntegrationListNative> {
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
                        "assets/TableView.imageset/TableView150.png"),
                    iconSize: 100,
                    onPressed: () {
                      setState(() {
                        widget.integrationType = "tableView";
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DemoNative(
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
            ],
          ),
          const SizedBox(width: 10),
          widget.selectedProvider == "direct"
              ? Column(children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 25),
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
                                builder: (context) => DemoNative(
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
                      ])),
                ])
              : const SizedBox(),
        ],
      ),
    );
  }
}
