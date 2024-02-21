class AppResponse {
  final bool success;
  final String message;
  final dynamic data;

  AppResponse({
    required this.success,
    required this.message,
    this.data,
  });
}