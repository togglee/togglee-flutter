import 'package:togglee_flutter/src/models/conditions_toggle.dart';
import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/models/toggle_type.dart';

class ContextToggle implements Toggle {
  @override
  final String name;

  @override
  final ToggleType type;

  final List<Conditions> conditions;

  const ContextToggle({required this.name, required this.type, required this.conditions});

  @override
  factory ContextToggle.fromJson(Map<String, dynamic> json) {
    return ContextToggle(
        name: json['name'],
        type: ToggleTypeExtension.parseType(json['type']),
        conditions: (json['conditions'] as List).map((data) => Conditions.fromJson(data)).toList());
  }
}