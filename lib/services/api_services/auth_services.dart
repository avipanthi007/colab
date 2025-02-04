import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/src/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final ApiBaseClientService _apiBaseClientService;

  AuthServices(this._apiBaseClientService);

  Future<Either<String, LoginModel>> login(
      {required String userName, required String password}) async {
    try {
      final response = await _apiBaseClientService.request(
        endpoint: ApiConstants.login,
        method: 'POST',
        data: {"user_id": userName, "password": password},
      );

      final success = response.data["success"] as bool;
      if (success) {
        final data = response.data;
        debugPrint('Fetch from Api services..: $data');

        // ✅ Convert response to LoginModel
        final loginModel = LoginModel.fromJson(data);
        return Right(loginModel);
      } else {
        return Left(response.data["message"] ?? "Something Went Wrong..!");
      }
    } catch (e) {
      return Left("Unexpected error: $e");
    }
  }
}
