// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'demo_main.dart';

class IntegrationItem extends StatefulWidget {
  String itemType;
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;

  IntegrationItem(
      {Key? key,
      required this.itemType,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<IntegrationItem> createState() => _IntegrationItemState();
}

class _IntegrationItemState extends State<IntegrationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(170, 184, 205, 1)),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Column(children: [
        IconButton(
          icon: Image.asset("assets/" +
              widget.itemType +
              ".imageset/" +
              widget.itemType +
              "150.png"),
          iconSize: 100,
          onPressed: () {
            setState(() {
              widget.integrationType = widget.itemType;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DemoMain(
                    integrationType: widget.integrationType,
                    selectedProvider: widget.selectedProvider,
                    selectedCreative: widget.selectedCreative,
                    selectedFormat: widget.selectedFormat,
                    selectedPID: widget.selectedPID),
              ),
            );
          },
        ),
        Text(
          widget.itemType,
          style: const TextStyle(
            color: Color.fromRGBO(170, 184, 205, 1),
          ),
        ),
      ]),
    );
  }
}
