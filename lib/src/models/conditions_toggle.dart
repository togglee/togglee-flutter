class Conditions {
  final String field;
  final String value;
  final String operation;

  const Conditions({required this.field, required this.value, required this.operation});

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
        field: json['field'],
        value: json['value'],
        operation: json['operation']);
  }
}