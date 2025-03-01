import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/src/models/approvers_list_model.dart';
import 'package:colab/src/models/contractor_list_model.dart';
import 'package:colab/src/models/labour_list_model.dart';
import 'package:colab/src/models/location_model.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/screens/dashboard/permits/create_permit_details.dart';
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
    try {
      final response = await _apiBaseClientService.request(
        endpoint: ApiConstants.approvers,
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
    try {
      final response = await _apiBaseClientService.request(
        endpoint: ApiConstants.contractors,
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
    try {
      final response = await _apiBaseClientService.request(
        endpoint: ApiConstants.location,
        method: 'GET',
      );

      debugPrint('Fetch success Location: ${response.data}');

      if (response.data != null && response.data['data'] != null) {
        final List<dynamic> results = response.data['data'];

        final location = results.map((json) => LocationModel.fromJson(json)).toList();

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
}
