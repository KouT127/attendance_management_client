import 'dart:convert';

import 'package:attendance_management/states/responses/user_response.dart';
import 'package:attendance_management/states/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class HttpClientService {
  const HttpClientService(
    this._client,
  );

  final Client _client;

  Future<Response> get(String url, {GetIdToken getToken}) async {
    final headers = <String, String>{};
    if (getToken == null) {
      return _client.get(url);
    }
    final token = await getToken();
    headers['Authorization'] = 'Bearer $token';
    return _client.get(url, headers: headers);
  }

  Future<Response> post(String url, dynamic body, {GetIdToken getToken}) async {
    final headers = <String, String>{};
    if (getToken == null) {
      return _client.post(url);
    }
    final token = await getToken();
    headers['Authorization'] = 'Bearer $token';
    return await _client.post(url, headers: headers);
  }

  Future<UserResponse> getUserMine() async {
    final response = await post(
      'http://10.0.2.2:8080/v1/users/mine',
      <String, String>{},
      getToken: FirebaseAuth.instance.currentUser.getIdToken,
    );
    final body = json.decode(response.body) as Map<String, dynamic>;
    return UserResponse.fromJson(body);
  }
}
