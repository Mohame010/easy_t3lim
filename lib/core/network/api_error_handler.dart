import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiErrorModel {
  final String message;
  final int? code;

  ApiErrorModel(this.message, {this.code});

  factory ApiErrorModel.fromJson(
    dynamic json, {
    int? code,
  }) {
    if (json is Map<String, dynamic>) {
      return ApiErrorModel(
        json['message']?.toString() ??
            json['error']?.toString() ??
            "حدث خطأ غير متوقع",
        code: code,
      );
    } else if (json is String) {
      return ApiErrorModel(json, code: code);
    } else {
      return ApiErrorModel("حدث خطأ غير متوقع", code: code);
    }
  }

  @override
  String toString() => "ApiErrorModel(code: $code, message: $message)";
}

abstract class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    debugPrint('❌ Error occurred: $error');
    switch (error) {
      case Response _:
        return _onResponse(error);
      case Exception _:
        return _onException(error);
      case String _:
        return ApiErrorModel(error);
      default:
        return _defaultErrorMessage(error);
    }
  }
}

ApiErrorModel _defaultErrorMessage(dynamic e) {
  return ApiErrorModel("حدث خطأ غير متوقع\n$e");
}

ApiErrorModel _onException(Exception error) {
  try {
    if (error is DioException) {
      return _onDioException(error);
    } else {
      return ApiErrorModel("$error");
    }
  } on FormatException catch (e) {
    return _defaultErrorMessage(e);
  }
}

ApiErrorModel _onResponse(Response response) {
  ApiErrorModel? errorResponse;
  try {
    errorResponse = ApiErrorModel.fromJson(
      response.data,
      code: response.statusCode,
    );
  } catch (e) {}

  final responseData = response.data.toString().contains('<!DOCTYPE html>')
      ? "<HTML content>"
      : response.data.toString().replaceAll('\n', ' ');

  debugPrint('<-- ❌ [${response.requestOptions.path}] (${response.statusCode}) $responseData');
  debugPrint('--- status message: ${response.statusMessage}');

  if (errorResponse == null) {
    return ApiErrorModel("${response.statusCode}: حدث خطأ غير متوقع");
  } else {
    return errorResponse;
  }
}

ApiErrorModel _onDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel("انتهت مهلة الاتصال");
    case DioExceptionType.sendTimeout:
      return ApiErrorModel("انتهت مهلة الإرسال");
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel("انتهت مهلة الاستقبال");
    case DioExceptionType.cancel:
      return ApiErrorModel("تم إلغاء الطلب");
    case DioExceptionType.connectionError:
      return ApiErrorModel("فشل الاتصال. تحقق من الإنترنت");
    case DioExceptionType.badCertificate:
      return ApiErrorModel("شهادة غير صالحة");
    case DioExceptionType.unknown:
      debugPrint("❌ Dio Unknown error (Maybe modeling issue): ${e.error}");
      return ApiErrorModel("خطأ غير معروف: ${e.message}");
    case DioExceptionType.badResponse:
      return _onBadResponse(e.response);
  }
}

ApiErrorModel _onBadResponse(Response? response) {
  // حالة 401 (انتهاء صلاحية الجلسة)
  if (response?.statusCode == 401) {
    return ApiErrorModel("انتهت صلاحية الجلسة. برجاء تسجيل الدخول مرة أخرى", code: 401);
  }

  final code = response?.statusCode;
  final message = response?.data is Map
      ? (response?.data?['message']?.toString() ??
          response?.data?['error']?.toString() ??
          response?.statusMessage ??
          "حدث خطأ غير متوقع")
      : response?.statusMessage ?? "حدث خطأ غير متوقع";

  ApiErrorModel? errorResponse;
  try {
    errorResponse = ApiErrorModel(
      message,
      code: code,
    );
  } catch (_) {}

  final responseData = response!.data.toString().contains('<!DOCTYPE html>')
      ? "<HTML content>"
      : response.data.toString().replaceAll('\n', ' ');

  debugPrint('<-- ❌ Bad response: [${response.requestOptions.path}] ($code) $responseData');
  debugPrint('-- error message: $message');

  if (errorResponse == null) {
    return ApiErrorModel("$code: $message");
  } else {
    return errorResponse;
  }
}
