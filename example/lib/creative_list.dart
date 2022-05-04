import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/main.dart';

class creative_list extends StatefulWidget {
  String selectedCreative;
  String selectedPID;
  creative_list(
      {Key? key, required this.selectedCreative, required this.selectedPID})
      : super(key: key);
  @override
  State<creative_list> createState() => _creative_listState();
}

class _creative_listState extends State<creative_list> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: widget.selectedPID);
    int items = 1;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, item) => Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: (() {
                            setState(() {
                              widget.selectedCreative = "landscape";
                            });
                          }),
                          style: widget.selectedCreative == "landscape"
                              ? TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )
                              : TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color.fromARGB(255, 21, 21, 195),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                          child: Text(
                            'LandScape',
                            style: widget.selectedCreative == "landscape"
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
                        width: 100,
                        child: TextButton(
                          onPressed: (() {
                            setState(() {
                              widget.selectedCreative = "vertical";
                            });
                          }),
                          style: widget.selectedCreative == "vertical"
                              ? TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )
                              : TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color.fromARGB(255, 21, 21, 195),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                          child: Text(
                            'Vertical',
                            style: widget.selectedCreative == "vertical"
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
                        width: 100,
                        child: TextButton(
                          onPressed: (() {
                            setState(() {
                              widget.selectedCreative = "square";
                            });
                          }),
                          style: widget.selectedCreative == "square"
                              ? TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )
                              : TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color.fromARGB(255, 21, 21, 195),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                          child: Text(
                            'Square',
                            style: widget.selectedCreative == "square"
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
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: (() {
                            setState(() {
                              widget.selectedCreative = "carousel";
                            });
                          }),
                          style: widget.selectedCreative == "carousel"
                              ? TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )
                              : TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color.fromARGB(255, 21, 21, 195),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                          child: Text(
                            'Carousel',
                            style: widget.selectedCreative == "carousel"
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
                        width: 100,
                        child: TextButton(
                          onPressed: (() {
                            setState(() {
                              widget.selectedCreative = "custom";
                            });
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 700,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Enter your custom pid'),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 16),
                                          child: TextField(
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                            child: const Text('OK'),
                                            onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => home(
                                                      selectedPID:
                                                          _controller.text,
                                                      selectedCreative:
                                                          "custom",
                                                    ),
                                                  ),
                                                )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                          style: widget.selectedCreative == "custom"
                              ? TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )
                              : TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Color.fromARGB(255, 21, 21, 195),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                          child: Text(
                            'Custom',
                            style: widget.selectedCreative == "custom"
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
