import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/integration_list_native.dart';
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
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        const TitleCategories(givenTitleCategories: "Formats"),
        FormatList(
          selectedFormat: _selectedFormat,
          notifyParent: refreshFormat,
        ),
        const TitleCategories(givenTitleCategories: "Providers"),
        ProviderList(
          selectedProvider: _selectedProvider,
          notifyParent: refreshProvider,
          selectedFormat: _selectedFormat,
        ),
        const TitleCategories(givenTitleCategories: "Creatives"),
        CreativeList(
            selectedCreative: _selectedCreative,
            selectedPID: _selectedPID,
            notifyParentCreative: refreshCreative,
            notifyParentPID: refreshPID,
            selectedFormat: _selectedFormat),
        const TitleCategories(givenTitleCategories: "Integrations"),
        _selectedFormat == "inread"
            ? IntegrationList(
                integrationType: _integrationType,
                selectedProvider: _selectedProvider,
                selectedCreative:
                    _selectedFormat == "inread" ? _selectedCreative : "display",
                selectedFormat: _selectedFormat,
                selectedPID: _selectedPID)
            : IntegrationListNative(
                integrationType: _integrationType,
                selectedProvider: _selectedProvider,
                selectedCreative:
                    _selectedFormat == "inread" ? _selectedCreative : "display",
                selectedFormat: _selectedFormat,
                selectedPID: _selectedPID)
      ]),
    );
  }
}
