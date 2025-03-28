import 'dart:convert';
import 'dart:developer';
import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/api_services/base_class_services.dart';
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
import 'package:colab/src/models/trigger_permit.dart';
import 'package:colab/src/views/widgets/custom_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PermitsServices {
  final ApiBaseClientService _apiBaseClientService;

  PermitsServices(this._apiBaseClientService);

  Future getClientId() async {
    return await LocalStorage.getUserId("userId");
  }

  int projectId = 1;
  Future<Either<String, List<PermitData>>> fetchExpiredData(
      {required page}) async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint:
            "${ApiConstants.expiredPermits}?client_id=${clientId}&project_id=${projectId}&mainId=35&type_of_date=EXPIRED&status=null&page=$page",
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
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetchPermitData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<PermitData>>> fetchFutureData() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint:
            "${ApiConstants.expiredPermits}?client_id=${clientId}&project_id=${projectId}&mainId=35&type_of_date=FUTURE&status=null&page=1",
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
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetchPermitData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<PermitData>>> fetchCurrentData() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint:
            "${ApiConstants.expiredPermits}?client_id=${clientId}&project_id=${projectId}&mainId=35&type_of_date=CURRENT&status=null&page=1",
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
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetchPermitData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<Approvers>>> approversData() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.approvers}/${clientId}",
        method: 'GET',
      );

      debugPrint('Fetch success: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final approvers =
            results.map((json) => Approvers.fromJson(json)).toList();

        debugPrint('Fetched permit data: $approvers');

        return Right(approvers);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetchPermitData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<ContractorsList>>> contractorsData() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.contractors}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success contractors: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final contractors =
            results.map((json) => ContractorsList.fromJson(json)).toList();

        debugPrint('Fetched contractors data: $contractors');

        return Right(contractors);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in contractors: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<Trade>>> laboursData() async {
    try {
      final response = await _apiBaseClientService.request(
        endpoint: ApiConstants.labours,
        method: 'GET',
      );

      debugPrint('Fetch success laboursData: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final labours = results.map((json) => Trade.fromJson(json)).toList();

        debugPrint('Fetched laboursData data: $labours');

        return Right(labours);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in laboursData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<LocationModel>>> getLocation() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.location}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success Location: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final location =
            results.map((json) => LocationModel.fromJson(json)).toList();

        debugPrint('Fetched Location data: $location');

        return Right(location);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in Location: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<PermitCounts>>> getPermitsCounts() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint:
            "${ApiConstants.permitCount}?client_id=${clientId}&project_id=${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success counts: ${response.data}');

      if (response.data != null && response.data != null) {
        final permitCountsJson = response.data as Map<String, dynamic>;

        final countsList = [
          PermitCounts.fromJson(permitCountsJson["permitCounts"])
        ];

        debugPrint('Fetched counts data: $countsList');
        return Right(countsList);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in counts: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<SubLocation>>> getSubLocation() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.subLocation}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success SubLocation: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final sublocation =
            results.map((json) => SubLocation.fromJson(json)).toList();

        debugPrint('Fetched sublocation data: $sublocation');

        return Right(sublocation);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in sublocation: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<SubSubLocation>>> getSubSubLocation() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.subsubLocation}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success SubLocation: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final subsublocation =
            results.map((json) => SubSubLocation.fromJson(json)).toList();

        debugPrint('Fetched subsubLocation data: $subsublocation');

        return Right(subsublocation);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in SubSubLocation: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<ActivityHead>>> getActivityHead() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.activityHead}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success activityHead: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final activityHead =
            results.map((json) => ActivityHead.fromJson(json)).toList();

        debugPrint('Fetched activityHead data: $activityHead');

        return Right(activityHead);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in activityHead: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, List<LinkingActivity>>> getlinkingActivity() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.linkingActivity}/${clientId}/${projectId}",
        method: 'GET',
      );

      debugPrint('Fetch success LinkingActivity: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final linkingActivity =
            results.map((json) => LinkingActivity.fromJson(json)).toList();

        debugPrint('Fetched LinkingActivity data: $linkingActivity');

        return Right(linkingActivity);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in activityHead: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  Future<Either<String, TriggerPermit>> triggerPermit(
      {required PermitConfigData data}) async {
    try {
      List<Map<String, dynamic>> permitList = [];
      List<Map<String, dynamic>> labourList = [];
      List approversList = [];
      List coRequesterList = [];
      data.permitTriggerLabours.forEach((element) {
        labourList.add({
          "labour_count": element.labourInput!.value.text,
          "trade": element.type.value,
          "pwr_type": element.pwrType
        });
      });
      data.permitApproveInfo.forEach((element) {
        approversList.addAll(element.approversData);
      });
      data.permitApproveInfo.forEach((element) {
        coRequesterList.addAll(element.coRequesterData);
      });
      data.permitSectionInfo.forEach((section) {
        section.permitSectionLinkInfo.forEach((sectionLink) {
          permitList.add({
            'question_manually': sectionLink.userInput.text.toString(),
            'hide_check_manually': sectionLink.hideCheckManually.value,
            "client_id": section.clientId,
            "project_id": section.projectId,
            "permit_trigger_id": null,
            "permit_trigger_section_id": section.id,
            "question": sectionLink.question,
            "line_comment": sectionLink.lineComment,
            "image": 0,
            "hide_check": 1,
            "line_comment_manually": true,
            "image_manually": sectionLink.imgUploaded.value?.path ?? "",
            "remark": ""
          });
          infoLog(sectionLink.imgUploaded.value?.path ?? "Image Not available");
        });
      });

      debugPrint('Request data: ${data}');

      final formData = FormData.fromMap({
        "data": jsonEncode([
          {
            "id": "",
            "client_id": data.clientId,
            "project_id": data.projectId,
            "created_by": "14",
            "permit_id": 86,
            "permit_name": data.permitName,
            "permit_type": data.permitType,
            "description": data.description,
            "location_id": data.locationId.value,
            "sub_location_id": data.subLocationId.value,
            "sub_sub_location_id": data.subSubLocationId.value,
            "activity_head_id": data.getActivityHeadId,
            "activity_id": data.getActivityId,
            "user_permission": coRequesterList,
            "permit_date": data.getPermitDate.toString(),
            "start_time": data.getStartTime.toString(),
            "end_time": data.getEndTime.toString(),
            "trigger_section": [
              {
                "client_id": data.clientId,
                "project_id": data.projectId,
                "permit_trigger_id": null,
                "section_name": data.permitSectionInfo.first.sectionName,
                "permitList": permitList
              }
            ],
            "approved_status": "",
            "trigger_by": "14",
            "approved_by": null,
            "approver": approversList,
            "contractor_id": data.getContractorId.value,
            "labours": labourList
          }
        ])
      });
      infoLog('Request data Location: $permitList');
      infoLog('Approver data **: $approversList');
      infoLog('Co-Requester data **: $coRequesterList');
      infoLog('Request data labourList: $labourList');

      final response = await _apiBaseClientService.request(
          endpoint: ApiConstants.triggerPermit,
          isMultipart: true,
          method: 'POST',
          formData: formData);

      final success = response.data["success"] as bool;
      if (success) {
        final data = response.data;
        debugPrint('Permit Created Successfully..: $data');

        final loginModel = TriggerPermit.fromJson(data);
        Utils.customToast("Permit Created Successfully");
        return Right(loginModel);
      } else {
        return Left(response.data["message"] ?? "Something Went Wrong..!");
      }
    } catch (e) {
      debugPrint('Exception details: $e');
      if (e is DioException && e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
        return Left(
            "API Error: ${e.response?.statusCode} - ${e.response?.data?["message"] ?? e.message}");
      }
      return Left("Unexpected error: $e");
    }
  }

  Future<Either<String, List<PermitConfigData>>> getPermitConfig() async {
    int clientId = await getClientId();
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "${ApiConstants.triggerConfig}",
        method: 'GET',
      );

      debugPrint('Fetch success PermitConfigData: ${response.data}');

      if (response.data != null && response.data['permitData'] != null) {
        final List<dynamic> results = response.data['permitData'];

        final permitConf =
            results.map((json) => PermitConfigData.fromJson(json)).toList();

        debugPrint('Fetched PermitConfigData data: $permitConf');

        return Right(permitConf);
      } else {
        final errorMessage =
            response.data?['message'] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in PermitConfigData: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }
}
