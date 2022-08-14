import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/network/api_client.dart';

import '../fixtures.dart';
import 'api_client_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  test("returns a Toggle list if the http call completes successfully", () async {
    final client = MockClient();
    const url = 'https://gist.githubusercontent.com/kanekotic/c469f99bef5a5c0634b4a94a4acd6546/raw/toggles';
    when(client.get(Uri.parse(url)))
        .thenAnswer((_) async =>
        http.Response(toggleJsonResponseOk, 200));
    expect(await fetchToggles(client, url), isA<List<Toggle>>());
  });
}
