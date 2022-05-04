import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class creative_list extends StatefulWidget {
  @override
  State<creative_list> createState() => _creative_listState();
}

class _creative_listState extends State<creative_list> {
  String _selectedCreative = "landscape";
  String _selectedPID = "84242";
  TextEditingController _controller = new TextEditingController(text: '84242');

  @override
  Widget build(BuildContext context) {
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
                              _selectedCreative = "landscape";
                            });
                          }),
                          style: _selectedCreative == "landscape"
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
                            style: _selectedCreative == "landscape"
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
                              _selectedCreative = "vertical";
                            });
                          }),
                          style: _selectedCreative == "vertical"
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
                            style: _selectedCreative == "vertical"
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
                              _selectedCreative = "square";
                            });
                          }),
                          style: _selectedCreative == "square"
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
                            style: _selectedCreative == "square"
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
                              _selectedCreative = "carousel";
                            });
                          }),
                          style: _selectedCreative == "carousel"
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
                            style: _selectedCreative == "carousel"
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
                              _selectedCreative = "custom";
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
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                          style: _selectedCreative == "custom"
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
                            style: _selectedCreative == "custom"
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
