// lib/core/errors/error_model.dart

class ErrorModel {
  final String errorMessage;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  ErrorModel({required this.errorMessage, this.statusCode, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage: _extractMessage(json),
      statusCode: json['statusCode'] ?? json['status'],
      errors: json['errors'],
    );
  }

  static String _extractMessage(Map<String, dynamic> json) {
    return json['message']?.toString() ??
        json['error']?.toString() ??
        json['title']?.toString() ??
        'Unknown error';
  }

  @override
  String toString() =>
      'ErrorModel(message: $errorMessage, status: $statusCode)';
}
