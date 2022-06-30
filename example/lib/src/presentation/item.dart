import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/src/extensions/colors.dart';
import 'package:teads_sdk_flutter_example/src/extensions/string.dart';

import './../models/format.dart';

class Item extends StatefulWidget {
  final Format selectedFormat;
  final dynamic type;
  final List list;
  final Function(dynamic) notifyParent;

  const Item(
      {Key? key, required this.selectedFormat, this.type, required this.list, required this.notifyParent})
      : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {

    int length = widget.list.length;
    int size = 2;
    List<List> chunks = [];

    for(var i = 0; i < length; i += size)
    {
      var end = (i + size < length)?i + size : length;
      chunks.add(widget.list.sublist(i,end));
    }

    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              children: chunks.map((arr) =>
                  Row(
                      children: arr.fold([], (list, item) => [
                        ...list,
                        Expanded(
                            child: SizedBox(
                              child: TextButton(
                                onPressed: () {
                                  widget.notifyParent(item);
                                },
                                child: Text(
                                    item.toString().split('.').last.capitalize(),
                                    style: TextStyle(
                                        color: widget.type == item
                                            ? Colors.white
                                            : primaryColor
                                    )
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: widget.type == item
                                      ? primaryColor
                                      : Colors.white,
                                  onSurface: Colors.grey,
                                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: primaryColor,
                                      ),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                ),
                              ),
                            )
                        ),
                        if (arr.length == 1) const Expanded(child: SizedBox()),
                        SizedBox(width: (arr.length > 1 && arr.last == item) ? 0 : 24),
                      ])
                  )
              ).toList(),
            )
        )
    );
  }
}
