import 'package:flutter/material.dart';

class TitleCategories extends StatelessWidget {
  const TitleCategories({
    Key? key,
    required this.givenTitleCategories,
  }) : super(key: key);

  final String givenTitleCategories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10,
        ),
        child: Text(
          givenTitleCategories,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
