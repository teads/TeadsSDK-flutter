import 'package:flutter/material.dart';

class creative_list extends StatefulWidget {
  String selectedCreative;
  String selectedPID;
  String selectedFormat;
  final Function(dynamic) notifyParentPID;
  final Function(dynamic) notifyParentCreative;
  creative_list(
      {Key? key,
      required this.selectedCreative,
      required this.selectedPID,
      required this.notifyParentPID,
      required this.notifyParentCreative,
      required this.selectedFormat})
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
              widget.selectedFormat == "inread"
                  ? Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: (() {
                                  widget.notifyParentCreative("landscape");
                                }),
                                style: widget.selectedCreative == "landscape"
                                    ? TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 21, 195),
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
                                              color: Color.fromARGB(
                                                  255, 21, 21, 195),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                child: Text(
                                  'LandScape',
                                  style: widget.selectedCreative == "landscape"
                                      ? const TextStyle(
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 195),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: (() {
                                  widget.notifyParentCreative("vertical");
                                }),
                                style: widget.selectedCreative == "vertical"
                                    ? TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 21, 195),
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
                                              color: Color.fromARGB(
                                                  255, 21, 21, 195),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                child: Text(
                                  'Vertical',
                                  style: widget.selectedCreative == "vertical"
                                      ? const TextStyle(
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 195),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: (() {
                                  widget.notifyParentCreative("square");
                                }),
                                style: widget.selectedCreative == "square"
                                    ? TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 21, 195),
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
                                              color: Color.fromARGB(
                                                  255, 21, 21, 195),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                child: Text(
                                  'Square',
                                  style: widget.selectedCreative == "square"
                                      ? const TextStyle(
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 195),
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
                                  widget.notifyParentCreative("carousel");
                                }),
                                style: widget.selectedCreative == "carousel"
                                    ? TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 21, 195),
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
                                              color: Color.fromARGB(
                                                  255, 21, 21, 195),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                child: Text(
                                  'Carousel',
                                  style: widget.selectedCreative == "carousel"
                                      ? const TextStyle(
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 195),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: (() {
                                  widget.notifyParentCreative("custom");
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
                                              const Text(
                                                  'Enter your custom pid'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 16),
                                                child: TextField(
                                                  controller: _controller,
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  child: const Text('OK'),
                                                  onPressed: () => {
                                                        widget.notifyParentPID(
                                                            _controller.text),
                                                        Navigator.pop(context),
                                                      })
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 21, 195),
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
                                              color: Color.fromARGB(
                                                  255, 21, 21, 195),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                child: Text(
                                  'Custom',
                                  style: widget.selectedCreative == "custom"
                                      ? const TextStyle(
                                          color: Colors.white,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 195),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: (() {}),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      const Color.fromARGB(255, 21, 21, 195),
                                  onSurface: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                child: const Text('Display',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
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
