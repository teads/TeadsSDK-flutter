import 'package:flutter/material.dart';

class provider_list extends StatefulWidget {
  @override
  State<provider_list> createState() => _provider_listState();
}

class _provider_listState extends State<provider_list> {
  String _selectedProvider = "direct";

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
                  SizedBox(width: 30),
                  TextButton(
                    onPressed: (() {
                      setState(() {
                        _selectedProvider = "direct";
                      });
                    }),
                    style: _selectedProvider == "direct"
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
                      'Direct',
                      style: _selectedProvider == "direct"
                          ? TextStyle(
                              color: Colors.white,
                            )
                          : TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      setState(() {
                        _selectedProvider = "admob";
                      });
                    }),
                    style: _selectedProvider == "admob"
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
                      'Admob',
                      style: _selectedProvider == "admob"
                          ? TextStyle(
                              color: Colors.white,
                            )
                          : TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      setState(() {
                        _selectedProvider = "mopub";
                      });
                    }),
                    style: _selectedProvider == "mopub"
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
                      'Mopub',
                      style: _selectedProvider == "mopub"
                          ? TextStyle(
                              color: Colors.white,
                            )
                          : TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      setState(() {
                        _selectedProvider = "smart";
                      });
                    }),
                    style: _selectedProvider == "smart"
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
                      'Smart',
                      style: _selectedProvider == "smart"
                          ? TextStyle(
                              color: Colors.white,
                            )
                          : TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
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
