import 'package:flutter/material.dart';

class format_list extends StatefulWidget {
  @override
  State<format_list> createState() => _format_listState();
}

class _format_listState extends State<format_list> {
  String _formatSelected = "inreads";

  @override
  Widget build(BuildContext context) {
    int items = 1;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, item) => Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        onPressed: (() {
                          setState(() {
                            _formatSelected = "inreads";
                          });
                        }),
                        style: _formatSelected == "inreads"
                            ? TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 21, 21, 195),
                                onSurface: Colors.grey,
                              )
                            : TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 100, 100, 217),
                                onSurface: Colors.grey,
                              ),
                        child: const Text('InReads')),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        onPressed: (() {
                          setState(() {
                            _formatSelected = "native";
                          });
                        }),
                        style: _formatSelected == "native"
                            ? TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 21, 21, 195),
                                onSurface: Colors.grey,
                              )
                            : TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 100, 100, 217),
                                onSurface: Colors.grey,
                              ),
                        child: const Text('Native')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
