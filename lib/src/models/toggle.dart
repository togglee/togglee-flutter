import 'package:togglee_flutter/src/models/toggle_type.dart';

abstract class Toggle {
  final String name;
  final ToggleType type;

  const Toggle({required this.name, required this.type});

  factory Toggle.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}