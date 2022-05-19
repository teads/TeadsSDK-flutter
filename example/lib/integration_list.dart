import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/integration_item.dart';

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
              integration_item(
                  item_type: "ScrollView",
                  integrationType: widget.integrationType,
                  selectedProvider: widget.selectedProvider,
                  selectedCreative: widget.selectedCreative,
                  selectedFormat: widget.selectedFormat,
                  selectedPID: widget.selectedPID),
              const SizedBox(height: 10),
              widget.selectedProvider == "admob"
                  ? integration_item(
                      item_type: "WebView",
                      integrationType: widget.integrationType,
                      selectedProvider: widget.selectedProvider,
                      selectedCreative: widget.selectedCreative,
                      selectedFormat: widget.selectedFormat,
                      selectedPID: widget.selectedPID)
                  : widget.selectedProvider == "mopub" ||
                          widget.selectedProvider == "smart"
                      ? const SizedBox(
                          height: 185,
                        )
                      : integration_item(
                          item_type: "CollectionView",
                          integrationType: widget.integrationType,
                          selectedProvider: widget.selectedProvider,
                          selectedCreative: widget.selectedCreative,
                          selectedFormat: widget.selectedFormat,
                          selectedPID: widget.selectedPID),
            ],
          ),
          const SizedBox(width: 10),
          Column(children: [
            integration_item(
                item_type: "TableView",
                integrationType: widget.integrationType,
                selectedProvider: widget.selectedProvider,
                selectedCreative: widget.selectedCreative,
                selectedFormat: widget.selectedFormat,
                selectedPID: widget.selectedPID),
            const SizedBox(height: 10),
            widget.selectedProvider == "admob"
                ? const SizedBox(
                    height: 185,
                  )
                : widget.selectedProvider == "mopub" ||
                        widget.selectedProvider == "smart"
                    ? const SizedBox(
                        height: 185,
                      )
                    : integration_item(
                        item_type: "WebView",
                        integrationType: widget.integrationType,
                        selectedProvider: widget.selectedProvider,
                        selectedCreative: widget.selectedCreative,
                        selectedFormat: widget.selectedFormat,
                        selectedPID: widget.selectedPID),
          ]),
        ],
      ),
    );
  }
}
