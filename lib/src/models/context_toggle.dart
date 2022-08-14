import 'package:togglee_flutter/src/models/conditions_toggle.dart';
import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/models/toggle_type.dart';

class ContextToggle implements Toggle {
  @override
  String name = '';

  @override
  ToggleType type = ToggleType.context;

  List<Conditions> conditions = [];
}