import 'package:flutter/material.dart';
import 'package:teads_sdk_flutter_example/src/extensions/string.dart';
import 'package:teads_sdk_flutter_example/src/models/format.dart';
import 'package:teads_sdk_flutter_example/src/models/integration.dart';
import 'package:teads_sdk_flutter_example/src/presentation/infeed_native/infeed_native_view.dart';
import 'package:teads_sdk_flutter_example/src/presentation/inread/inread_view.dart';

class IntegrationList extends StatefulWidget {
  final Format selectedFormat;

  const IntegrationList({
    Key? key,
    required this.selectedFormat,
  }) : super(key: key);

  @override
  State<IntegrationList> createState() => _IntegrationListState();
}

class _IntegrationListState extends State<IntegrationList> {
  @override
  Widget build(BuildContext context) {
    int length = IntegrationType.values.length;
    int size = 2;
    List<List> chunks = [];

    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(IntegrationType.values.sublist(i, end));
    }

    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              children: chunks
                  .map((arr) => Row(
                      children: arr.fold(
                          [],
                          (list, item) => [
                                ...list,
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            widget.selectedFormat.provider
                                                .integrationType = item;
                                          });

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => widget
                                                            .selectedFormat
                                                            .type ==
                                                        FormatType.inRead
                                                    ? DemoMain(
                                                        selectedFormat: widget
                                                            .selectedFormat)
                                                    : DemoNative(
                                                        selectedFormat: widget
                                                            .selectedFormat)),
                                          );
                                        },
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        child: Image.asset("assets/" +
                                                            item
                                                                .toString()
                                                                .split('.')
                                                                .last
                                                                .capitalize() +
                                                            ".imageset/" +
                                                            item
                                                                .toString()
                                                                .split('.')
                                                                .last
                                                                .capitalize() +
                                                            "150.png"),
                                                        height: 100),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      item
                                                          .toString()
                                                          .split('.')
                                                          .last
                                                          .capitalize(),
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            170, 184, 205, 1),
                                                      ),
                                                    ),
                                                  ]),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              170,
                                                              184,
                                                              205,
                                                              1)),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(15.0),
                                                  ))),
                                        ))),
                                if (arr.length == 1)
                                  const Expanded(child: SizedBox(height: 100)),
                                SizedBox(
                                    width: (arr.length > 1 && arr.last == item)
                                        ? 0
                                        : 24),
                              ])))
                  .toList(),
            )));
  }
}
