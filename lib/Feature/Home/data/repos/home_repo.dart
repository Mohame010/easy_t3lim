import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Home/data/model/home_request_body.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:desktop_app/core/network/api_service.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo({required this.apiService});
  Future<ApiResult<LoginResponseModel>> home(
    HomeRequestBody requestBody,
  ) async {
    try {
      final response = await apiService.home(requestBody.token);
      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(e.toString());
    }
  }
}
