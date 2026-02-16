class SignupRequestBody {
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final bool agreedToTerms;
  final String role;

  SignupRequestBody({
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.agreedToTerms,
    this.role = 'parent',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'agreedToTerms': agreedToTerms,
      'role': role,
    };
  }
}
