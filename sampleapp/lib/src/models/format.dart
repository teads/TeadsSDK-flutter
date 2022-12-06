import 'dart:io';

import 'creative.dart';
import 'provider.dart';

enum FormatType { inRead, native }

extension FormatTypeString on FormatType {
  String get value {
    switch (this) {
      case FormatType.inRead:
        return "InRead";
      case FormatType.native:
        return "Native";
    }
  }
}

class Format {
  FormatType type;
  Provider provider;
  static String customPID = '84242';

  Format(this.type, this.provider);

  String get pid {
    switch (type) {
      case FormatType.inRead:
        switch (provider.type) {
          case ProviderType.direct:
            switch (provider.creativeType) {
              case CreativeType.landscape:
                return "84242";
              case CreativeType.vertical:
                return "127546";
              case CreativeType.square:
                return "127547";
              case CreativeType.carousel:
                return "128779";
              default:
                return Format.customPID;
            }
          case ProviderType.admob:
            switch (provider.creativeType) {
              case CreativeType.landscape:
                return Platform.isAndroid
                    ? "ca-app-pub-3068786746829754/3486435166"
                    : "ca-app-pub-3068786746829754/2411019030";
              default:
                return Format.customPID;
            }
        }
      case FormatType.native:
        switch (provider.type) {
          case ProviderType.direct:
            switch (provider.creativeType) {
              case CreativeType.display:
                return "162594";
              default:
                return Format.customPID;
            }
          case ProviderType.admob:
            return Platform.isAndroid
                ? "ca-app-pub-3068786746829754/9820813147"
                : "ca-app-pub-3068786746829754/6007333247";
        }
    }
  }

  List<ProviderType> get providers {
    switch (type) {
      case FormatType.inRead:
        return [ProviderType.direct, ProviderType.admob];
      case FormatType.native:
        return [ProviderType.direct, ProviderType.admob];
    }
  }

  List<CreativeType> get creatives {
    switch (type) {
      case FormatType.inRead:
        switch (provider.type) {
          case ProviderType.direct:
            return [
              CreativeType.landscape,
              CreativeType.vertical,
              CreativeType.square,
              CreativeType.carousel,
              CreativeType.custom,
            ];
            break;
          case ProviderType.admob:
            return [
              CreativeType.landscape,
              CreativeType.custom,
            ];
        }
        break;
      case FormatType.native:
        return [
          CreativeType.display,
          CreativeType.custom,
        ];
    }
  }
}
