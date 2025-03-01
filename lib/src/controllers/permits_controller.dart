import 'dart:io';

import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/api_services/base_class_services.dart';
import 'package:colab/services/api_services/permits_services.dart';
import 'package:colab/src/models/add_contractor.dart';
import 'package:colab/src/models/approvers_list_model.dart';
import 'package:colab/src/models/contractor_list_model.dart';
import 'package:colab/src/models/labour_list_model.dart';
import 'package:colab/src/models/location_model.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/screens/dashboard/permits/create_permit_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PermitsController extends GetxController {
  late PermitsServices permitsServices;

  PermitsController() {
    final _apiBaseClientService = ApiBaseClientService();
    permitsServices = PermitsServices(_apiBaseClientService);
  }

  final contractorName = "".obs;
   final locationName = "".obs;
  final approverName = "".obs;
  final coRequesterName = "".obs;

  RxBool isLoading = false.obs;
  var permitDataList = <PermitData>[].obs;
  var approversDataList = <Approvers>[].obs;
  var contractorDataList = <ContractorsList>[].obs;
  var laboursList = <Trade>[].obs;
  var locationList = <LocationModel>[].obs;

  RxList<File> photos = <File>[].obs;

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
        isLoading.value = false;
      },
    );
  }

  RxList<LabourItem> labourItems = <LabourItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    labourItems.add(LabourItem(type: '', quantity: 0));
  }

  void addLabourRow() {
    labourItems.add(LabourItem(type: '', quantity: 0));
  }

  void deleteLabourRow(int index) {
    if (labourItems.length > 1) {
      labourItems.removeAt(index);
    }
  }

  void updateLabourType(int index, String type) {
    final updatedItem =
        LabourItem(type: type, quantity: labourItems[index].quantity);
    labourItems[index] = updatedItem;
  }

  void updateLabourQuantity(int index, int quantity) {
    final updatedItem =
        LabourItem(type: labourItems[index].type, quantity: quantity);
    labourItems[index] = updatedItem;
  }
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      final List<XFile>? selectedImages = await _picker.pickMultiImage();
      if (selectedImages != null) {
        if (photos.length + selectedImages.length > 8) {
          infoLog('upload upto 8 Photos');
        } else {
          photos
              .addAll(selectedImages.map((e) => File(e.path)));
          infoLog("Image added in list: ${photos.length}");
        }
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  bool isValidImageFormat(String path) {
    final allowedExtensions = ['jpg', 'jpeg', 'png'];
    final extension = path.split('.').last.toLowerCase();
    return allowedExtensions.contains(extension);
  }

  Future<void> captureImageWithCamera() async {
    try {
      final XFile? capturedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (capturedImage != null) {
        if (isValidImageFormat(capturedImage.path)) {
          if (photos.length >= 8) {
            infoLog('upload upto 8 Photos');
          } else {
            photos.add(File(capturedImage.path));
          }
        } else {
          errorLog("Invalid image format. Only jpg, jpeg, or png are allowed.");
        }
      }
    } catch (e) {
      errorLog("Error capturing image: $e");
    }
  }

  
}
