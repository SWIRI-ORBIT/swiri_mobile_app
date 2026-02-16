class ApiErrorModel {
  final String? message;
  final int? statusCode;

  ApiErrorModel({this.message, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
