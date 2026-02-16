import 'package:swiri/features/auth/data/models/user.dart';

class AuthResponse {
  final bool success;
  final int statusCode;
  final String message;
  final String token;
  final User user;

  AuthResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return AuthResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      token: data['token'] ?? '',
      user: User.fromJson(data['user'] ?? {}),
    );
  }
}
