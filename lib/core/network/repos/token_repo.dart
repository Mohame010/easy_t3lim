import 'dart:developer';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:dio/dio.dart';

class TokenRepo {
  final Dio dio;
  TokenRepo(this.dio);

  Future<TokenCheckResult> checkToken(String token) async {
    try {
      final response = await dio.post(
        '${ApiConstans.baseUrl}${ApiConstans.checkToken}',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      final data = response.data as Map<String, dynamic>;

      return TokenCheckResult.fromJson(data);
    } on DioException catch (e) {
      log("❌ Dio error: ${e.message}");
      return TokenCheckResult(
        status: false,
        message: "Network error: ${e.message}",
      );
    } catch (e) {
      log("⚠️ Unexpected error: $e");
      return TokenCheckResult(status: false, message: "Unexpected error: $e");
    }
  }
}

class TokenCheckResult {
  final bool status;
  final String message;

  TokenCheckResult({required this.status, required this.message});

  factory TokenCheckResult.fromJson(Map<String, dynamic> json) {
    return TokenCheckResult(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  @override
  String toString() => 'TokenCheckResult(status: $status, message: $message)';
}
