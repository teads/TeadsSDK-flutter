enum CreativeType {
  landscape,
  vertical,
  square,
  carousel,
  display,
  custom,
}

extension CreativeTypeString on CreativeType {
  String get value {
    switch (this) {
      case CreativeType.landscape:
        return "Landscape";
      case CreativeType.vertical:
        return "Vertical";
      case CreativeType.square:
        return "Square";
      case CreativeType.carousel:
        return "Carousel";
      case CreativeType.display:
        return "Display";
      case CreativeType.custom:
        return "Cusctom";
    }
  }
}