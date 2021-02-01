import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

typedef OnRatioUpdated = void Function(double adRatio);

class TeadsViewController {
  MethodChannel _channel;

  final OnRatioUpdated onRatioUpdated;

  TeadsViewController({
    @required int id,
    @required this.onRatioUpdated
  }) {
    _channel = new MethodChannel('TeadsView/$id');
    _channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'OnRatioUpdated':
        double adRatio = call.arguments as double;
        this.onRatioUpdated(adRatio);
    }
  }
}