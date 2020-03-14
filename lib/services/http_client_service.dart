import 'package:attendance_management/models/models.dart';
import 'package:http/http.dart';

class HttpClientService {
  HttpClientService(
    this._client,
  );

  final Client _client;

  factory HttpClientService.create() {
    return HttpClientService(
      Client(),
    );
  }

  Future<Response> get(String url, {GetIdToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken == null) {
      return _client.get(url);
    }
    final tokenResult = await getToken(refresh: true);
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.get(url, headers: headers);
  }

  Future<Response> post(String url, dynamic body, {GetIdToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken != null) {
      return _client.post(url);
    }
    final tokenResult = await getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.post(url, headers: headers);
  }
}
