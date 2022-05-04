import 'package:flutter/material.dart';

class format_list extends StatefulWidget {
  String selectedFormat;
  format_list({Key? key, required this.selectedFormat}) : super(key: key);

  @override
  State<format_list> createState() => _format_listState();
}

class _format_listState extends State<format_list> {
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
                    width: 160,
                    child: TextButton(
                      onPressed: (() {
                        setState(() {
                          widget.selectedFormat = "inread";
                        });
                      }),
                      style: widget.selectedFormat == "inread"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
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
                                    color: Color.fromARGB(255, 21, 21, 195),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                      child: Text(
                        'InRead',
                        style: widget.selectedFormat == "inread"
                            ? TextStyle(
                                color: Colors.white,
                              )
                            : TextStyle(
                                color: Color.fromARGB(255, 21, 21, 195),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 160,
                    child: TextButton(
                      onPressed: (() {
                        setState(() {
                          widget.selectedFormat = "native";
                        });
                      }),
                      style: widget.selectedFormat == "native"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
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
                                    color: Color.fromARGB(255, 21, 21, 195),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                      child: Text(
                        'Native',
                        style: widget.selectedFormat == "native"
                            ? TextStyle(
                                color: Colors.white,
                              )
                            : TextStyle(
                                color: Color.fromARGB(255, 21, 21, 195),
                              ),
                      ),
                    ),
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
