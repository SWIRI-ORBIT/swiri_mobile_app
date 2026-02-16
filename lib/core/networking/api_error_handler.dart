import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout occurred");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "Request send timeout occurred");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "Response receive timeout occurred");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request was cancelled");
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: "Bad SSL certificate");
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection error occurred");
        case DioExceptionType.unknown:
          return ApiErrorModel(message: "An unknown network error occurred");
      }
    } else {
      return ApiErrorModel(message: error.toString());
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data?['message'] ?? 'Unknown error occurred 2',
    // statusCode: data?['error']['statusCode'],
    // status: data?['error']['status'],
  );
}
