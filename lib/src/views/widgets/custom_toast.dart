import 'package:colab/core/theme/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void customToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryBlue,
        textColor: AppColors.white,
        fontSize: 16.0);
  }
}