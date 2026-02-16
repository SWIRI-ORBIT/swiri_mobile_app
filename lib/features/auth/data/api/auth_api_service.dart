import 'package:dio/dio.dart';
import 'package:swiri/core/networking/api_constants.dart';
import 'package:swiri/features/auth/data/models/auth_response.dart';
import 'package:swiri/features/auth/data/models/login_request_body.dart';
import 'package:swiri/features/auth/data/models/signup_request_body.dart';
import 'package:swiri/features/auth/data/models/location_response.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<AuthResponse> login(LoginRequestBody requestBody) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: requestBody.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> signup(SignupRequestBody requestBody) async {
    final response = await _dio.post(
      ApiConstants.signup,
      data: requestBody.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<LocationResponse> getChildLatestLocation(String childId) async {
    final response = await _dio.get('/api/locations/latest/$childId');
    return LocationResponse.fromJson(response.data['data']);
  }
}
