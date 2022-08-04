enum IntegrationType { listView }

extension IntegrationTypeString on IntegrationType {
  String get value {
    switch (this) {
      case IntegrationType.listView:
        return "ListView";
    }
  }
}
