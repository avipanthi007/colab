import 'package:colab/core/theme/colors.dart';
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