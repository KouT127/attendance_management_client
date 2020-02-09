import 'package:attendance_management/services/auth.dart';
import 'package:http/http.dart';

class HttpClient {
  HttpClient(
    this._client,
  );

  final Client _client;

  factory HttpClient.create() {
    return HttpClient(
      Client(),
    );
  }

  Future<Response> get(String url, {GetToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken == null) {
      return _client.get(url);
    }
    final tokenResult = await getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.get(url, headers: headers);
  }

  Future<Response> post(String url, dynamic body, {GetToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken != null) {
      return _client.post(url);
    }
    final tokenResult = await getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.post(url, headers: headers);
  }
}
