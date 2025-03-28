import 'dart:io';

import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/services/api_services/permits_services.dart';
import 'package:colab/src/models/activity_head_model.dart';
import 'package:colab/src/models/approvers_list_model.dart';
import 'package:colab/src/models/contractor_list_model.dart';
import 'package:colab/src/models/labour_list_model.dart';
import 'package:colab/src/models/linking_activity_model.dart';
import 'package:colab/src/models/location_model.dart';
import 'package:colab/src/models/permit_config_model.dart';
import 'package:colab/src/models/permit_count_model.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/models/sub_location_model.dart';
import 'package:colab/src/models/sub_sub_location_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermitsController extends GetxController {
  late PermitsServices permitsServices;

  PermitsController() {
    final _apiBaseClientService = ApiBaseClientService();
    permitsServices = PermitsServices(_apiBaseClientService);
  }

  final contractorName = "".obs;
  final locationId = "".obs;
  final subLocationId = 0.obs;
  final subsubLocationId = 0.obs;
  final locationName = "".obs;
  final subLocationName = "".obs;
  final subsubLocationName = "".obs;
  final approverName = "".obs;
  final coRequesterId = 0.obs;
  final coRequesterName = "".obs;
  final activityId = 0.obs;
  final activityHeadId = 0.obs;
  final activityName = "".obs;
  final activityHeadName = "".obs;
  final activityHead = "".obs;
  final linkingActivityId = 0.obs;
  final linkingActivity = "".obs;
  final filteredLinkingList = <LinkingActivity>[].obs;

  RxString permitTo = "".obs;
  RxString permitFrom = "".obs;

  RxBool isLoading = false.obs;
  var permitExpiredList = <PermitData>[].obs;
  var permitFutureList = <PermitData>[].obs;
  var permitCurrentList = <PermitData>[].obs;

  var approversDataList = <Approvers>[].obs;
  var contractorDataList = <ContractorsList>[].obs;
  var laboursList = <Trade>[].obs;
  var locationList = <LocationModel>[].obs;
  var permitCounts = <PermitCounts>[].obs;
  var subLocationList = <SubLocation>[].obs;
  var subsubLocationList = <SubSubLocation>[].obs;
  var activityHeadList = <ActivityHead>[].obs;
  var linkingActivityList = <LinkingActivity>[].obs;
  var permitConfigList = <PermitConfigData>[].obs;

 Future<void> fetchExpiredData({required int page}) async {
    isLoading.value = true;
    try {
      final result = await permitsServices.fetchExpiredData(page: page);
      result.fold(
        (failure) {
          debugPrint('Fetch failed: $failure');
        },
        (success) {
          if (page == 1) {
            permitExpiredList.clear();
          }
          permitExpiredList.addAll(success);
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFutureData() async {
    isLoading.value = true;
    print("Fetching Permit Data...");
    final result = await permitsServices.fetchFutureData();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
      },
      (success) {
        permitFutureList.assignAll(success);
        infoLog('Fetched Future Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> fetchCurrentData() async {
    isLoading.value = true;
    print("Fetching Permit Data...");
    final result = await permitsServices.fetchCurrentData();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
      },
      (success) {
        permitCurrentList.assignAll(success);
        infoLog('Fetched Future Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> approversData() async {
    isLoading.value = true;
    print("Fetching Permit Data...");
    final result = await permitsServices.approversData();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed Approvers: $failure');
      },
      (success) {
        approversDataList.assignAll(success);
        infoLog('Fetched Approvers Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> contractorsData() async {
    isLoading.value = true;
    print("Fetching Permit Data...");
    final result = await permitsServices.contractorsData();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed contractorsData: $failure');
      },
      (success) {
        contractorDataList.assignAll(success);
        infoLog('Fetched contractorsData Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> laboursData() async {
    isLoading.value = true;
    print("Fetching laboursData Data...");
    final result = await permitsServices.laboursData();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed laboursData: $failure');
      },
      (success) {
        laboursList.assignAll(success);
        infoLog('Fetched laboursData Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> getLocation() async {
    isLoading.value = true;
    print("Fetching Location Data...");
    final result = await permitsServices.getLocation();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed Location: $failure');
      },
      (success) {
        locationList.assignAll(success);
        infoLog('Fetched Location Data: $success');
        for (var location in locationList) {
          location.subLocations = subLocationList.where((subLocation) {
            return subLocation.locationId == location.locationId;
          }).toList();
        }
        isLoading.value = false;

        infoLog("all locations");
        locationList.forEach((loc) {
          infoLog(loc.toJson().toString());
        });
      },
    );
  }

  Future<void> getSubLocation() async {
    isLoading.value = true;
    print("Fetching SubLocation Data...");
    final result = await permitsServices.getSubLocation();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed SubLocation: $failure');
      },
      (success) {
        subLocationList.assignAll(success);
        for (var subLocation in subLocationList) {
          subLocation.subSubLocations =
              subsubLocationList.where((subSubLocation) {
            return subSubLocation.subLocId == subLocation.subLocId;
          }).toList();
        }
        infoLog('Fetched SubLocation Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> getPermitsCounts() async {
    isLoading.value = true;
    print("Fetching permitCounts Data...");
    final result = await permitsServices.getPermitsCounts();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed permitCounts: $failure');
      },
      (success) {
        permitCounts.clear();
        permitCounts.addAll(success);
        infoLog('Fetched permitCounts Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> getSubSubLocation() async {
    isLoading.value = true;
    print("Fetching subsubLocation Data...");
    final result = await permitsServices.getSubSubLocation();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed subsubLocation: $failure');
      },
      (success) {
        subsubLocationList.clear();
        subsubLocationList.addAll(success);
        infoLog('Fetched subsubLocation Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> getActivityHead() async {
    isLoading.value = true;
    infoLog("Fetching activityHeadList Data...");
    final result = await permitsServices.getActivityHead();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed activityHeadList: $failure');
      },
      (success) {
        activityHeadList.clear();
        activityHeadList.addAll(success);
        for (var activity in activityHeadList) {
          activity.linkingData = linkingActivityList.where((linkingAct) {
            return linkingAct.activityId == activity.activityId;
          }).toList();
        }
        infoLog('Fetched activityHeadList Data: $success');
        isLoading.value = false;
        infoLog("all Activity");
        activityHeadList.forEach((act) {
          infoLog("AAAAA" + act.toJson().toString());
        });
      },
    );
  }

  Future<void> getlinkingActivity() async {
    isLoading.value = true;
    print("Fetching linkingActivity Data...");
    final result = await permitsServices.getlinkingActivity();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed linkingActivity: $failure');
      },
      (success) {
        linkingActivityList.clear();
        linkingActivityList.addAll(success);
        infoLog('Fetched linkingActivity Data: $success');
        isLoading.value = false;
      },
    );
  }

  Future<void> triggerPermit({
    required PermitConfigData data,
  }) async {
    isLoading.value = true;
    try {
      final result = await permitsServices.triggerPermit(data: data);
      result.fold(
        (failure) {
          isLoading.value = false;
          debugPrint('Fetch failed Create Permit: $failure');
        },
        (data) async {
          isLoading.value = false;
        },
      );
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error fetching user data: $e');
    }
  }

  Future<void> getPermitConfig() async {
    isLoading.value = true;
    print("Fetching getPermitConfig Data...");
    final result = await permitsServices.getPermitConfig();
    result.fold(
      (failure) {
        isLoading.value = false;
        errorLog('Fetch failed getPermitConfig: $failure');
      },
      (success) {
        permitConfigList.clear();
        permitConfigList.addAll(success);
        infoLog('Fetched getPermitConfig Data: $success');
        isLoading.value = false;
      },
    );
  }
}
