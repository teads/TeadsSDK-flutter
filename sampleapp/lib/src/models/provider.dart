import 'creative.dart';
import 'integration.dart';

enum ProviderType { direct, admob }

extension ProviderTypeString on ProviderType {
  String get value {
    switch (this) {
      case ProviderType.direct:
        return "Direct";
      case ProviderType.admob:
        return "Admob";
    }
  }
}

class Provider {
  ProviderType type;
  CreativeType creativeType;
  IntegrationType integrationType;

  Provider(this.type, this.creativeType, this.integrationType);
}
