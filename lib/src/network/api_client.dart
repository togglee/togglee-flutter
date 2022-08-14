import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:togglee_flutter/src/models/context_toggle.dart';
import 'package:togglee_flutter/src/models/release_toggle.dart';
import 'package:togglee_flutter/src/models/toggle.dart';

Future<List<Toggle>> fetchToggles(http.Client client, String url) async {
  final response = await client.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body)['toggles'];
    final List<Toggle> toggles = List<Toggle>.from(jsonList.map((jsonData) => _convertToToggle(jsonData)));
    return toggles;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Toggle List');
  }
}

Toggle _convertToToggle(Map<String, dynamic> json) {
  if (json['type'] == 'context') {
    return ContextToggle.fromJson(json);
  }
  return ReleaseToggle.fromJson(json);
}
