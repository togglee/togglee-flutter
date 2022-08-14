import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/models/toggle_type.dart';

class ReleaseToggle implements Toggle {
  @override
  String name = '';

  @override
  ToggleType type = ToggleType.release;

  bool value = false;
}