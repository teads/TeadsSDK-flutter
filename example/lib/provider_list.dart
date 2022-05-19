// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProviderList extends StatefulWidget {
  String selectedProvider;
  String selectedFormat;
  final Function(dynamic) notifyParent;
  ProviderList(
      {Key? key,
      required this.selectedProvider,
      required this.notifyParent,
      required this.selectedFormat})
      : super(key: key);

  @override
  State<ProviderList> createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  widget.selectedFormat == "inread"
                      ? TextButton(
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
                            'Smart',
                            style: widget.selectedProvider == "smart"
                                ? const TextStyle(
                                    color: Colors.white,
                                  )
                                : const TextStyle(
                                    color: Color.fromARGB(255, 21, 21, 195),
                                  ),
                          ),
                        )
                      : const SizedBox(
                          width: 10,
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
