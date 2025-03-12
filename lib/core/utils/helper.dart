import 'dart:developer';
import 'dart:io';

import 'package:colab/core/theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final Logger logger = Logger();
void errorLog(String e){
logger.e(e);
}
 void infoLog(String e){
logger.i(e);
}




class CustomToast {
  static void customToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryBlue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
PopupMenuItem<dynamic> repeatedPopup(
      {required String title, Function()? ontap}) {
    return PopupMenuItem(
      child: ListTile(
        onTap: ontap,
        title: Text(title),
      ),
    );
  }
  String formatDate(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd MMMM yyyy')
          .format(date); 
    } catch (e) {
      return dateStr;
    }
  }

  String formatTime(String? timeStr) {
    if (timeStr == null) return '';
    try {
      DateTime dateTime;
      if (timeStr.contains('T')) {
        dateTime = DateTime.parse(timeStr);
      } else {
        final parts = timeStr.split(':');
        final now = DateTime.now();
        dateTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(parts[0]),
          int.parse(parts[1]),
        );
      }
      return DateFormat('hh:mm a').format(dateTime); 
    } catch (e) {
      return timeStr;
    }
  }

  String formatFullDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return '';
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      final date = DateFormat('dd MMMM yyyy').format(dateTime);
      final time = DateFormat('hh:mm a').format(dateTime);
      return '$date\n$time';
    } catch (e) {
      return dateTimeStr;
    }
    
  }

   final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? selectedXFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (selectedXFile != null) {
        if (isValidImageFormat(selectedXFile.path)) {
          final file = File(selectedXFile.path);
          return file;
        } else {
          errorLog("Invalid image format. Only jpg, jpeg, or png are allowed.");
        }
      }
      return null;
    } catch (e) {
      log("Error picking image: $e");
      return null;
    }
  }

  Future<File?> captureImageWithCamera() async {
    try {
      final XFile? capturedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (capturedImage != null) {
        if (isValidImageFormat(capturedImage.path)) {
          return File(capturedImage.path);
        } else {
          errorLog("Invalid image format. Only jpg, jpeg, or png are allowed.");
        }
      }
    } catch (e) {
      errorLog("Error capturing image: $e");
    }
    return null;
  }

  bool isValidImageFormat(String path) {
    final allowedExtensions = ['jpg', 'jpeg', 'png'];
    final extension = path.split('.').last.toLowerCase();
    final isValid = allowedExtensions.contains(extension);

    log("File path: $path");
    log("Extracted extension: $extension");
    log("Is valid format: $isValid");

    return isValid;
  }