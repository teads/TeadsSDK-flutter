import 'package:flutter/material.dart';
import 'integration_list.dart';
import 'provider_list.dart';

import 'title.dart';
import 'format_list.dart';

import 'creative_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(
        selectedPID: "84242",
        selectedCreative: "landscape",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatefulWidget {
  String selectedPID;
  String selectedCreative;
  home({Key? key, required this.selectedPID, required this.selectedCreative})
      : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //default values
  String _selectedFormat = "inread";
  String _selectedProvider = "direct";
  String _integrationType = "scrollview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: Container(
            height: 30,
            child: (Image.asset(
                "assets/Teads-Sample-App.imageset/Teads-Sample-App-black.png")),
          ),
          leading: Container(
            height: 30,
            child: (Image.asset("assets/logo.png")),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        const title(giventitle: "Formats"),
        format_list(
          selectedFormat: _selectedFormat,
        ),
        const title(giventitle: "Providers"),
        provider_list(
          selectedProvider: _selectedProvider,
        ),
        const title(giventitle: "Creatives"),
        creative_list(
          selectedCreative: widget.selectedCreative,
          selectedPID: widget.selectedPID,
        ),
        const title(giventitle: "Integrations"),
        integration_list(
            integrationType: _integrationType,
            selectedProvider: _selectedProvider,
            selectedCreative: widget.selectedCreative,
            selectedFormat: _selectedFormat,
            selectedPID: widget.selectedPID),
      ]),
    );
  }
}
