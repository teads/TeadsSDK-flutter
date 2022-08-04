import 'creative.dart';
import 'integration.dart';

enum ProviderType { direct }

extension ProviderTypeString on ProviderType {
  String get value {
    switch (this) {
      case ProviderType.direct:
        return "Direct";
    }
  }
}

class Provider {
  ProviderType type;
  CreativeType creativeType;
  IntegrationType integrationType;

  Provider(this.type, this.creativeType, this.integrationType);
}
