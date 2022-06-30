// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:math' as math;

class InFeedDemo extends StatefulWidget {
  String icon;
  String text;
  String title;
  String media;
  String time;
  String source;
  String textButton;

  InFeedDemo({
    Key? key,
    required this.icon,
    required this.text,
    required this.title,
    required this.media,
    required this.time,
    required this.source,
    required this.textButton,
  }) : super(key: key);

  @override
  State<InFeedDemo> createState() => _InFeedDemoState();
}

class _InFeedDemoState extends State<InFeedDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.icon),
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
              title: Text(widget.source),
              trailing: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.lightBlue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10.0))),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
                onPressed: () {},
                child: Text(widget.textButton),
              ),
              subtitle: Text(
                widget.time + "min",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    child: Image.network(widget.media),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
