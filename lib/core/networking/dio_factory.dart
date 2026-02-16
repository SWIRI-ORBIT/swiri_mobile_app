import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:swiri/core/helpers/consts.dart';
import 'package:swiri/core/helpers/shared_pref_helper.dart';
import 'package:swiri/core/networking/api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConstants.apiBaseUrl;
      dio!.options.connectTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;
      dio!.options.sendTimeout = timeOut;
      addDioHeaders();
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void addDioInterceptors() {
    dio?.interceptors.addAll([
      _authInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    ]);
  }

  static Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await SharedPrefHelper.getSecuredString(
          SharedPrefKeys.userToken,
        );

        if (token.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $token";
        } else {
          options.headers.remove('Authorization');
        }

        return handler.next(options);
      },
    );
  }
}
