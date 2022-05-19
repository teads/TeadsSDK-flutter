// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/integration_item.dart';

class IntegrationList extends StatefulWidget {
  String integrationType;
  String selectedProvider;
  String selectedCreative;
  String selectedFormat;
  String selectedPID;
  IntegrationList(
      {Key? key,
      required this.integrationType,
      required this.selectedProvider,
      required this.selectedCreative,
      required this.selectedFormat,
      required this.selectedPID})
      : super(key: key);

  @override
  State<IntegrationList> createState() => _IntegrationListState();
}

class _IntegrationListState extends State<IntegrationList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const SizedBox(width: 20),
          Column(
            children: [
              IntegrationItem(
                  itemType: "ScrollView",
                  integrationType: widget.integrationType,
                  selectedProvider: widget.selectedProvider,
                  selectedCreative: widget.selectedCreative,
                  selectedFormat: widget.selectedFormat,
                  selectedPID: widget.selectedPID),
              const SizedBox(height: 10),
              widget.selectedProvider == "admob"
                  ? IntegrationItem(
                      itemType: "WebView",
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
                      : IntegrationItem(
                          itemType: "CollectionView",
                          integrationType: widget.integrationType,
                          selectedProvider: widget.selectedProvider,
                          selectedCreative: widget.selectedCreative,
                          selectedFormat: widget.selectedFormat,
                          selectedPID: widget.selectedPID),
            ],
          ),
          const SizedBox(width: 10),
          Column(children: [
            IntegrationItem(
                itemType: "TableView",
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
                    : IntegrationItem(
                        itemType: "WebView",
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
