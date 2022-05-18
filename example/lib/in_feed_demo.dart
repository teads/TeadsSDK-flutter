import 'package:flutter/material.dart';
import 'dart:math' as math;

class in_feed_demo extends StatefulWidget {
  String icon;
  String text;
  String title;
  String media;
  String time;
  String source;

  in_feed_demo({
    Key? key,
    required this.icon,
    required this.text,
    required this.title,
    required this.media,
    required this.time,
    required this.source,
  }) : super(key: key);

  @override
  State<in_feed_demo> createState() => _in_feed_demoState();
}

class _in_feed_demoState extends State<in_feed_demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              subtitle: Text(
                widget.time + "min",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                padding: EdgeInsets.all(16),
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
