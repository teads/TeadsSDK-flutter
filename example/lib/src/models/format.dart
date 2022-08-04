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
        }
      case FormatType.native:
        switch (provider.type) {
          case ProviderType.direct:
            switch (provider.creativeType) {
              case CreativeType.display:
                return "124859";
              default:
                return Format.customPID;
            }
        }
    }
  }

  List<ProviderType> get providers {
    switch (type) {
      case FormatType.inRead:
        return [ProviderType.direct];
      case FormatType.native:
        return [ProviderType.direct];
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
