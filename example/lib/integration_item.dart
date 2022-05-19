import 'package:flutter/material.dart';
import 'demo_main.dart';

class integration_item extends StatefulWidget {
  String item_type;
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;

  integration_item(
      {Key? key,
      required this.item_type,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<integration_item> createState() => _integration_itemState();
}

class _integration_itemState extends State<integration_item> {
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
              widget.item_type +
              ".imageset/" +
              widget.item_type +
              "150.png"),
          iconSize: 100,
          onPressed: () {
            setState(() {
              widget.integrationType = widget.item_type;
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
        Text(
          widget.item_type,
          style: TextStyle(
            color: Color.fromRGBO(170, 184, 205, 1),
          ),
        ),
      ]),
    );
  }
}
