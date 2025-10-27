import 'package:desktop_app/Feature/splash/data/model/app_update_info_model.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:dio/dio.dart';

class SplashRepo {
  final Dio dio;
  SplashRepo(this.dio);

  Future<AppUpdateInfoModel> getAppUpdateInfo() async {
    try {
      final response = await dio.get(
        '${ApiConstans.baseUrl}${ApiConstans.appUpdateInfo}',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        if (data['status'] == true && data['data'] != null) {
          return AppUpdateInfoModel.fromJson(data['data']);
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
