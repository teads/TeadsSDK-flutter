import 'package:flutter/material.dart';

class formats extends StatefulWidget {
  @override
  State<formats> createState() => _formatsState();
}

class _formatsState extends State<formats> {
  @override
  Widget build(BuildContext context) {
    int items = 2;
    return SliverToBoxAdapter(
        child: Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items,
                itemBuilder: (context, item) => Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              child: Card(
                                child: Text("InRead"),
                              ),
                            )
                          ],
                        )
                      ],
                    ))));
  }
}
