import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class creative_list extends StatefulWidget {
  @override
  State<creative_list> createState() => _creative_listState();
}

class _creative_listState extends State<creative_list> {
  String _selectedCreative = "landscape";

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
                  SizedBox(width: 2.5),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedCreative = "landscape";
                        });
                      }),
                      style: _selectedCreative == "landscape"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
                              onSurface: Colors.grey,
                            )
                          : TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 100, 100, 217),
                              onSurface: Colors.grey,
                            ),
                      child: const Text('LandScape')),
                  SizedBox(width: 2.5),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedCreative = "vertical";
                        });
                      }),
                      style: _selectedCreative == "vertical"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
                              onSurface: Colors.grey,
                            )
                          : TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 100, 100, 217),
                              onSurface: Colors.grey,
                            ),
                      child: const Text('Vertical')),
                  SizedBox(width: 2.5),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedCreative = "square";
                        });
                      }),
                      style: _selectedCreative == "square"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
                              onSurface: Colors.grey,
                            )
                          : TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 100, 100, 217),
                              onSurface: Colors.grey,
                            ),
                      child: const Text('Square')),
                  SizedBox(width: 2.5),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedCreative = "carousel";
                        });
                      }),
                      style: _selectedCreative == "carousel"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
                              onSurface: Colors.grey,
                            )
                          : TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 100, 100, 217),
                              onSurface: Colors.grey,
                            ),
                      child: const Text('Carousel')),
                  SizedBox(width: 2.5),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedCreative = "custom";
                        });
                      }),
                      style: _selectedCreative == "custom"
                          ? TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 21, 21, 195),
                              onSurface: Colors.grey,
                            )
                          : TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 100, 100, 217),
                              onSurface: Colors.grey,
                            ),
                      child: const Text('Custom')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
