
import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/src/controllers/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    Get.lazyPut<Dio>(() => dio);

    Get.lazyPut(() => AuthController());
 
  }
}
