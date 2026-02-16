class LoginRequestBody {
  final String identifier;
  final String password;

  LoginRequestBody({required this.identifier, required this.password});

  Map<String, dynamic> toJson() {
    return {'identifier': identifier, 'password': password};
  }
}
