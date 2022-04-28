import 'package:flutter/material.dart';

class IntegrationTitle extends StatefulWidget {
  @override
  State<IntegrationTitle> createState() => _IntegrationTitleState();
}

class _IntegrationTitleState extends State<IntegrationTitle> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Integrations"),
    );
  }
}
