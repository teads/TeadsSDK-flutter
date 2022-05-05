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
    return const MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //default values
  String _selectedFormat = "inread";
  String _selectedProvider = "direct";
  String _integrationType = "scrollview";
  String _selectedPID = "84242";
  String _selectedCreative = "landscape";

  //update state
  refreshFormat(dynamic childValue) {
    setState(() {
      _selectedFormat = childValue;
    });
  }

  refreshProvider(dynamic childValue) {
    setState(() {
      _selectedProvider = childValue;
    });
  }

  refreshCreative(dynamic childValue) {
    setState(() {
      _selectedCreative = childValue;
    });
  }

  refreshPID(dynamic childValue) {
    setState(() {
      _selectedPID = childValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: SizedBox(
            height: 30,
            child: (Image.asset(
                "assets/Teads-Sample-App.imageset/Teads-Sample-App-black.png")),
          ),
          leading: SizedBox(
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
          notifyParent: refreshFormat,
        ),
        const title(giventitle: "Providers"),
        provider_list(
          selectedProvider: _selectedProvider,
          notifyParent: refreshProvider,
        ),
        const title(giventitle: "Creatives"),
        creative_list(
            selectedCreative: _selectedCreative,
            selectedPID: _selectedPID,
            notifyParentCreative: refreshCreative,
            notifyParentPID: refreshPID),
        const title(giventitle: "Integrations"),
        integration_list(
            integrationType: _integrationType,
            selectedProvider: _selectedProvider,
            selectedCreative: _selectedCreative,
            selectedFormat: _selectedFormat,
            selectedPID: _selectedPID),
      ]),
    );
  }
}
