import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/services/api_services/permits_services.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermitsController extends GetxController {
  late PermitsServices permitsServices;

  PermitsController() {
    final _apiBaseClientService = ApiBaseClientService();
    permitsServices = PermitsServices(_apiBaseClientService);
  }

  RxBool isLoading = false.obs;
  var permitDataList = <PermitData>[].obs; // ✅ Correct type

  Future<void> fetchPermitData() async {
    isLoading.value = true;
    print("Fetching Permit Data...");
    final result = await permitsServices.fetchPermitData();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
      },
      (success) {
        permitDataList.assignAll(success);
        infoLog('Fetched Permit Data: $success');
        isLoading.value = false;
      },
    );
  }
}
