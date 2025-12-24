import 'package:chatbotstudy/core/network/api_client.dart';
import 'package:chatbotstudy/core/network/endpoints.dart';

class AuthApi {
  final ApiClient _client;
  AuthApi({ApiClient? client}) : _client = client ?? ApiClient();

  Future<Map<String, dynamic>> login(String email, String password) {
    return _client.post(Endpoints.login, body: {
      'email': email,
      'password': password,
    });
  }
}
