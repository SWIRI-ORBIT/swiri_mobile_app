import 'package:swiri/core/networking/api_error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) => Success(data);
  factory ApiResult.failure(ApiErrorModel error) => Failure(error);
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ApiErrorModel error;
  const Failure(this.error);
}
