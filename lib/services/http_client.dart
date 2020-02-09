import 'package:attendance_management/models/user.dart';
import 'package:http/http.dart';

class HttpClient {
  final Client _client;
  User user;

  HttpClient(this._client, this.user);

  factory HttpClient.create() {
    final client = Client();
    return HttpClient(client, null);
  }

  HttpClient update(User user) {
    this.user = user;
    return this;
  }

  Future<Response> get(String url) async {
    Map<String, String> headers = Map();
    if (user != null) {
      return _client.get(url);
    }
    final tokenResult = await user.getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.get(url, headers: headers);
  }

  Future<Response> post(String url, dynamic body) async {
    Map<String, String> headers = Map();
    if (user != null) {
      return _client.post(url);
    }
    final tokenResult = await user.getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.post(url, headers: headers);
  }

  Future<Response> put(String url, dynamic body) async {
    Map<String, String> headers = Map();
    if (user != null) {
      return _client.put(url);
    }
    final tokenResult = await user.getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.put(url, headers: headers);
  }

  Future<Response> delete(String url) async {
    Map<String, String> headers = Map();
    if (user != null) {
      return _client.delete(url);
    }
    final tokenResult = await user.getToken();
    headers['Authorization'] = 'Bearer ' + tokenResult.token;
    return _client.delete(url, headers: headers);
  }
}
