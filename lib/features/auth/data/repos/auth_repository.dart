import 'dart:convert';

import 'package:swiri/core/helpers/consts.dart';
import 'package:swiri/core/helpers/shared_pref_helper.dart';
import 'package:swiri/core/networking/api_error_handler.dart';
import 'package:swiri/core/networking/api_result.dart';
import 'package:swiri/features/auth/data/api/auth_api_service.dart';
import 'package:swiri/features/auth/data/models/auth_response.dart';
import 'package:swiri/features/auth/data/models/login_request_body.dart';
import 'package:swiri/features/auth/data/models/signup_request_body.dart';

class AuthRepository {
  final AuthApiService _authApiService;

  AuthRepository(this._authApiService);

  Future<ApiResult<AuthResponse>> login(LoginRequestBody requestBody) async {
    try {
      final response = await _authApiService.login(requestBody);

      // Save token to secure storage
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        response.token,
      );

      // Save user data to shared preferences
      await SharedPrefHelper.setData(
        SharedPrefKeys.userData,
        jsonEncode(response.user.toJson()),
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AuthResponse>> signup(SignupRequestBody requestBody) async {
    try {
      final response = await _authApiService.signup(requestBody);

      // Save token to secure storage
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        response.token,
      );

      // Save user data to shared preferences
      await SharedPrefHelper.setData(
        SharedPrefKeys.userData,
        jsonEncode(response.user.toJson()),
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
