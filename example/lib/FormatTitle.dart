import 'package:flutter/material.dart';

class FormatTitle extends StatefulWidget {
  @override
  State<FormatTitle> createState() => _FormatTitleState();
}

class _FormatTitleState extends State<FormatTitle> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Formats"),
    );
  }
}
