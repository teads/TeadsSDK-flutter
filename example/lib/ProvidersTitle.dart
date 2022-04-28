import 'package:flutter/material.dart';

class ProvidersTitle extends StatefulWidget {
  @override
  State<ProvidersTitle> createState() => _ProvidersTitleState();
}

class _ProvidersTitleState extends State<ProvidersTitle> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Providers"),
    );
  }
}
