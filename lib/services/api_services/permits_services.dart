import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PermitsServices {
   final ApiBaseClientService _apiBaseClientService;

  PermitsServices(this._apiBaseClientService);
Future<Either<String, List<PermitData>>> fetchPermitData() async {
  try {
    final response = await _apiBaseClientService.request(
      endpoint: ApiConstants.expiredPermits,
      method: 'GET',
    );

    debugPrint('Fetch success: ${response.data}');

    if (response.data != null && response.data['permitData'] != null) {
      final List<dynamic> results = response.data['permitData']['results'];

      final permitsList =
          results.map((json) => PermitData.fromJson(json)).toList();

      debugPrint('Fetched permit data: $permitsList');

      return Right(permitsList);
    } else {
      final errorMessage = response.data?['message'] ?? "Something went wrong!";
      return Left(errorMessage);
    }
  } catch (e, stackTrace) {
    debugPrint('Error in fetchPermitData: $e\n$stackTrace');
    return Left("Unexpected error: ${e.toString()}");
  }
}

}