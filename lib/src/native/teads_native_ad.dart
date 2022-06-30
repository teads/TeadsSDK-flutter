import 'package:flutter/services.dart';
import 'package:teads_sdk_flutter/src/teads_ad.dart';

class TeadsNativeAd extends TeadsAd {

  TeadsNativeAd(String requestIdentifier) : super(requestIdentifier);

  String? _title;
  String? _content;
  String? _image;
  String? _icon;
  String? _sponsored;
  String? _callToAction;
  String? _video;
  String? _rating;
  String? _price;
  String? _adChoices;

  Future<void> register(String containerView) async {
    await channel.invokeMethod('register', [containerView]);
  }

  Future<String?> get title async {
    _title = await channel.invokeMethod('title');
    return _title;
  }

  Future<String?> get content async {
    _content = await channel.invokeMethod('content');
    return _content;
  }

  Future<String?> get image async {
    _image = await channel.invokeMethod('image');
    return _image;
  }

  Future<String?> get icon async {
    _icon = await channel.invokeMethod('icon');
    return _icon;
  }

  Future<String?> get sponsored async {
    _sponsored = await channel.invokeMethod('sponsored');
    return _sponsored;
  }

  Future<String?> get callToAction async {
    _callToAction = await channel.invokeMethod('callToAction');
    return _callToAction;
  }

  Future<String?> get video async {
    _video = await channel.invokeMethod('video');
    return _video;
  }

  Future<String?> get rating async {
    _rating = await channel.invokeMethod('rating');
    return _rating;
  }

  Future<String?> get price async {
    _price = await channel.invokeMethod('price');
    return _price;
  }

  Future<String?> get adChoices async {
    _adChoices = await channel.invokeMethod('adChoices');
    return _adChoices;
  }
}