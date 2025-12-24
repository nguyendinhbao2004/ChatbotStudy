import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exception.dart';
import 'endpoints.dart';

class ApiClient {
  final http.Client _client;
  final String baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;

  ApiClient({
    http.Client? client,
    String? baseUrl,
    Duration? timeout,
    Map<String, String>? defaultHeaders,
  })  : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? Endpoints.baseUrl,
        timeout = timeout ?? const Duration(seconds: 20),
        defaultHeaders = {
          'Content-Type': 'application/json',
          ...?defaultHeaders,
        };

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = _buildUri(path, query);
    final resp = await _client
        .get(uri, headers: _mergeHeaders(headers))
        .timeout(timeout);
    return _handleResponse(resp);
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = _buildUri(path, query);
    final resp = await _client
        .post(uri, headers: _mergeHeaders(headers), body: _encodeBody(body))
        .timeout(timeout);
    return _handleResponse(resp);
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = _buildUri(path, query);
    final resp = await _client
        .put(uri, headers: _mergeHeaders(headers), body: _encodeBody(body))
        .timeout(timeout);
    return _handleResponse(resp);
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = _buildUri(path, query);
    final resp = await _client
        .delete(uri, headers: _mergeHeaders(headers))
        .timeout(timeout);
    return _handleResponse(resp);
  }

  Uri _buildUri(String path, Map<String, dynamic>? query) {
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final uri = Uri.parse(base).resolve(path);
    if (query == null || query.isEmpty) return uri;
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      ...query.map((k, v) => MapEntry(k, '$v')),
    });
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {
      ...defaultHeaders,
      ...headers ?? {},
    };
  }

  String? _encodeBody(Object? body) {
    if (body == null) return null;
    if (body is String) return body;
    return jsonEncode(body);
  }

  Map<String, dynamic> _handleResponse(http.Response resp) {
    final code = resp.statusCode;
    final text = resp.body;
    if (code >= 200 && code < 300) {
      if (text.isEmpty) return {};
      final decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) return decoded;
      return {'data': decoded};
    }
    throw ApiException(statusCode: code, message: 'HTTP $code', data: text);
  }
}
