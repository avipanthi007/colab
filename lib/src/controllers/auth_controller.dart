import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/api_services/auth_services.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/services/routing/routing.dart';
import 'package:colab/src/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  late AuthServices authServices;

  AuthController() {
    final apiBaseClientService = ApiBaseClientService();
    authServices = AuthServices(apiBaseClientService);
  }
  RxBool isLoading = false.obs;
  Rx<LoginModel?> userData = Rx<LoginModel?>(null);

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  Future<void> login() async {
    isLoading.value = true;
    try {
      final result = await authServices.login(
          userName: usernameController.value.text,
          password: passwordController.value.text);
      result.fold(
        (failure) {
          isLoading.value = false;
          debugPrint('Fetch failed: $failure');
        },
        (data) async {
          userData.value = data;
          await LocalStorage.setToken("token", userData.value!.token);
          await LocalStorage.setUserId("userId", userData.value!.data.clientId);
          if (userData.value != null) {
            navigatorKey.currentContext!.go(RoutePath.bottomBar);
          }

          debugPrint('Fetch success user data: $userData');
          isLoading.value = false;
        },
      );
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error fetching user data: $e');
    }
  }
}
