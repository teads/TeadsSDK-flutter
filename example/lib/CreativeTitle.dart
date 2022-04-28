import 'package:flutter/material.dart';

class CreativeTitle extends StatefulWidget {
  @override
  State<CreativeTitle> createState() => _CreativeTitleState();
}

class _CreativeTitleState extends State<CreativeTitle> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Creatives"),
    );
  }
}
