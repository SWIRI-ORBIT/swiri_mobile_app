import 'package:swiri/features/auth/data/models/child.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String termsAcceptedAt;
  final String authProvider;
  final String role;
  final List<Child> children;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.termsAcceptedAt,
    required this.authProvider,
    required this.role,
    required this.children,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final childrenList = json['children'] as List<dynamic>? ?? [];
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      termsAcceptedAt: json['termsAcceptedAt'] ?? '',
      authProvider: json['authProvider'] ?? '',
      role: json['role'] ?? '',
      children: childrenList
          .map((child) => Child.fromJson(child as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'termsAcceptedAt': termsAcceptedAt,
      'authProvider': authProvider,
      'role': role,
      'children': children.map((child) => child.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
