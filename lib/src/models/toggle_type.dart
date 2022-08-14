enum ToggleType {
  release, context
}

extension ToggleTypeExtension on ToggleType {
  static ToggleType parseType(final String toggleValue) {
    switch (toggleValue) {
      case 'context':
        return ToggleType.context;
      default:
        return ToggleType.release;
    }
  }
}

