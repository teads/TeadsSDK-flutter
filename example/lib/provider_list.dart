import 'package:flutter/material.dart';

class provider_list extends StatefulWidget {
  @override
  State<provider_list> createState() => _provider_listState();
}

class _provider_listState extends State<provider_list> {
  String _selectedProvider = "Direct";

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
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedProvider = "Direct";
                        });
                      }),
                      style: _selectedProvider == "Direct"
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
                      child: const Text('Direct')),
                  SizedBox(width: 20),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedProvider = "Admob";
                        });
                      }),
                      style: _selectedProvider == "Admob"
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
                      child: const Text('Admob')),
                  SizedBox(width: 20),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedProvider = "Mopub";
                        });
                      }),
                      style: _selectedProvider == "Mopub"
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
                      child: const Text('Mopub')),
                  SizedBox(width: 20),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          _selectedProvider = "Smart";
                        });
                      }),
                      style: _selectedProvider == "Smart"
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
                      child: const Text('Smart')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
