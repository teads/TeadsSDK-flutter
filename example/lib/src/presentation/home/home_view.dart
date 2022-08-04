import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/src/models/creative.dart';
import 'package:teads_sdk_flutter_example/src/models/format.dart';
import 'package:teads_sdk_flutter_example/src/models/integration.dart';
import 'package:teads_sdk_flutter_example/src/models/provider.dart';
import 'package:teads_sdk_flutter_example/src/presentation/home/home_integration_list_item.dart';
import 'package:teads_sdk_flutter_example/src/presentation/home/home_list_item.dart';
import 'package:teads_sdk_flutter_example/src/presentation/home/title_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Format _selectedFormat = Format(
      FormatType.inRead,
      Provider(ProviderType.direct, CreativeType.landscape,
          IntegrationType.listView));

  //update state
  refreshFormat(dynamic childValue) {
    setState(() {
      _selectedFormat.type = childValue;
      _selectedFormat.provider.creativeType = _selectedFormat.creatives.first;
    });
  }

  refreshProvider(dynamic childValue) {
    setState(() {
      _selectedFormat.provider.type = childValue;
    });
  }

  refreshCreative(dynamic childValue) {
    setState(() {
      _selectedFormat.provider.creativeType = childValue;
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
        Item(
          selectedFormat: _selectedFormat,
          type: _selectedFormat.type,
          list: FormatType.values,
          notifyParent: refreshFormat,
        ),
        const TitleCategories(givenTitleCategories: "Providers"),
        Item(
          selectedFormat: _selectedFormat,
          type: _selectedFormat.provider.type,
          list: _selectedFormat.providers,
          notifyParent: refreshProvider,
        ),
        const TitleCategories(givenTitleCategories: "Creatives"),
        Item(
          selectedFormat: _selectedFormat,
          type: _selectedFormat.provider.creativeType,
          list: _selectedFormat.creatives,
          notifyParent: refreshCreative,
        ),
        const TitleCategories(givenTitleCategories: "Integrations"),
        IntegrationList(selectedFormat: _selectedFormat)
      ]),
    );
  }
}
