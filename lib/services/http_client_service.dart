import 'package:attendance_management/models/models.dart';
import 'package:http/http.dart';

class HttpClientService {
  const HttpClientService(
    this._client,
  );

  final Client _client;

  Future<Response> get(String url, {GetIdToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken == null) {
      return _client.get(url);
    }
    final token = await getToken();
    headers['Authorization'] = 'Bearer ' + token;
    return _client.get(url, headers: headers);
  }

  Future<Response> post(String url, dynamic body, {GetIdToken getToken}) async {
    Map<String, String> headers = Map();
    if (getToken == null) {
      return _client.post(url);
    }
    final token = await getToken();
    headers['Authorization'] = 'Bearer ' + token;
    return _client.post(url, headers: headers);
  }
}
