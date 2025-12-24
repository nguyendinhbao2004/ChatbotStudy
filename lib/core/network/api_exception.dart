class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final Object? data;

  const ApiException({this.statusCode, required this.message, this.data});

  @override
  String toString() => 'ApiException($statusCode, $message)';
}
