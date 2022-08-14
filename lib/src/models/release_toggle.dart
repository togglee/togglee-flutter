import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/models/toggle_type.dart';

class ReleaseToggle implements Toggle {
  @override
  final String name;

  @override
  final ToggleType type;

  final bool value;

  const ReleaseToggle({required this.name, required this.type, required this.value});

  @override
  factory ReleaseToggle.fromJson(Map<String, dynamic> json) {
    return ReleaseToggle(
        name: json['name'],
        type: ToggleTypeExtension.parseType(json['type']),
        value: json['value']);
  }
}