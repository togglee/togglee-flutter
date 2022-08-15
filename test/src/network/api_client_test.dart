import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:togglee_flutter/src/models/context_toggle.dart';
import 'package:togglee_flutter/src/models/release_toggle.dart';
import 'package:togglee_flutter/src/models/toggle.dart';
import 'package:togglee_flutter/src/network/api_client.dart';

import '../fixtures.dart';
import 'api_client_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  const url = 'https://gist.githubusercontent.com/kanekotic/c469f99bef5a5c0634b4a94a4acd6546/raw/toggles';
  late MockClient client;

  setUp(() {
    client = MockClient();
  });
  
  test("returns a Toggle list if the http call completes successfully", () async {
    when(client.get(Uri.parse(url)))
        .thenAnswer((_) async =>
        http.Response(toggleJsonResponseOk, 200));
    final list = await fetchToggles(client, url);
    expect(list, isA<List<Toggle>>());
    expect(list[0], isA<ReleaseToggle>());
    expect(list[2], isA<ContextToggle>());
    expect(list.length, equals(4));
  });

  test("returns a Toggle Empty list if the http call completes successfully with empty response", () async {
    when(client.get(Uri.parse(url)))
        .thenAnswer((_) async =>
        http.Response(toggleJsonEmptyResponseOk, 200));
    final list = await fetchToggles(client, url);
    expect(list, isA<List<Toggle>>());
    expect(list.length, equals(0));
  });

  test("throws an exception if the http call completes with an error", () async {
    when(client.get(Uri.parse(url)))
        .thenAnswer((_) async =>
        http.Response("Not Found", 404));
    expect(fetchToggles(client, url), throwsException);
  });
}
