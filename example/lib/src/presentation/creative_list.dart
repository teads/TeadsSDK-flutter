// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/src/extensions/colors.dart';
import 'package:teads_sdk_flutter_example/src/models/creative.dart';
import 'package:teads_sdk_flutter_example/src/models/format.dart';

class CreativeList extends StatefulWidget {
  Format selectedFormat;
  final Function(dynamic) notifyParent;
  CreativeList(
      { Key? key,
        required this.selectedFormat,
        required this.notifyParent
      }) : super(key: key);
  @override
  State<CreativeList> createState() => _CreativeListState();
}

class _CreativeListState extends State<CreativeList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.selectedFormat.creatives.length,
          itemBuilder: (context, index) {
            var element = widget.selectedFormat.creatives[index];
            return SizedBox(
              child: TextButton(
                onPressed: (() {
                  widget.notifyParent(element);
                }),
                style: widget.selectedFormat.provider.creativeType == element
                    ? TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: primaryColor,
                  onSurface: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                )
                    : TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.white,
                  onSurface: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: primaryColor,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                ),
                child: Text(
                  element.value,
                  style: widget.selectedFormat.provider.creativeType == element
                      ? const TextStyle(
                    color: Colors.white,
                  )
                      : const TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
