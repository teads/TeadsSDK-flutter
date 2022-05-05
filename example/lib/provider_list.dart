import 'package:flutter/material.dart';

class provider_list extends StatefulWidget {
  String selectedProvider;
  final Function(dynamic) notifyParent;
  provider_list(
      {Key? key, required this.selectedProvider, required this.notifyParent})
      : super(key: key);

  @override
  State<provider_list> createState() => _provider_listState();
}

class _provider_listState extends State<provider_list> {
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
                  const SizedBox(width: 30),
                  TextButton(
                    onPressed: (() {
                      widget.notifyParent("direct");
                    }),
                    style: widget.selectedProvider == "direct"
                        ? TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 21, 21, 195),
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
                      style: widget.selectedProvider == "direct"
                          ? const TextStyle(
                              color: Colors.white,
                            )
                          : const TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      widget.notifyParent("admob");
                    }),
                    style: widget.selectedProvider == "admob"
                        ? TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 21, 21, 195),
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
                      style: widget.selectedProvider == "admob"
                          ? const TextStyle(
                              color: Colors.white,
                            )
                          : const TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      widget.notifyParent("mopub");
                    }),
                    style: widget.selectedProvider == "mopub"
                        ? TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 21, 21, 195),
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
                      style: widget.selectedProvider == "mopub"
                          ? const TextStyle(
                              color: Colors.white,
                            )
                          : const TextStyle(
                              color: Color.fromARGB(255, 21, 21, 195),
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: (() {
                      widget.notifyParent("smart");
                    }),
                    style: widget.selectedProvider == "smart"
                        ? TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 21, 21, 195),
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
                      style: widget.selectedProvider == "smart"
                          ? const TextStyle(
                              color: Colors.white,
                            )
                          : const TextStyle(
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
