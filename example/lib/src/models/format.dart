import 'creative.dart';
import 'provider.dart';

enum FormatType {
  inRead,
  native
}

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
                return "0";
            }
          case ProviderType.admob:
            switch (provider.creativeType) {
              case CreativeType.landscape:
                return "ca-app-pub-3068786746829754/2411019030";
              case CreativeType.vertical:
                return "ca-app-pub-3068786746829754/5776283742";
              case CreativeType.square:
                return "ca-app-pub-3068786746829754/1034598116";
              case CreativeType.carousel:
                return "ca-app-pub-3068786746829754/5832124062";
              default:
                return "0";
            }
        }
      case FormatType.native:
        switch (provider.type) {
          case ProviderType.direct:
            switch (provider.creativeType) {
              case CreativeType.display:
                return "162594";// "124859";
              default:
                return "0";
            }
          case ProviderType.admob:
            switch (provider.creativeType) {
              case CreativeType.display:
                return "ca-app-pub-3068786746829754/6007333247";
              default:
                return "0";
            }
        }
    }
  }

  List<ProviderType> get providers {
    switch (type) {
      case FormatType.inRead:
        return [
          ProviderType.direct,
          ProviderType.admob,
        ];
      case FormatType.native:
        return [
          ProviderType.direct,
          ProviderType.admob,
        ];
    }
  }

  List<CreativeType> get creatives {
    switch (type) {
      case FormatType.inRead:
        return [
          CreativeType.landscape,
          CreativeType.vertical,
          CreativeType.square,
          CreativeType.carousel,
          CreativeType.custom,
        ];
      case FormatType.native:
        return [
          CreativeType.display,
          CreativeType.custom,
        ];
    }
  }
}