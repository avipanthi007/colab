import 'package:colab/core/theme/colors.dart';
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
      return DateFormat('hh:mm a').format(dateTime); // e.g., "04:50 PM"
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