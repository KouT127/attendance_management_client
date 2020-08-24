import 'package:attendance_management/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<Response> getUserMine() async {
    final response = await post(
      'http://10.0.2.2:8080/v1/users/mine',
      Map(),
      getToken: FirebaseAuth.instance.currentUser.getIdToken,
    );
    return response;
  }
}
