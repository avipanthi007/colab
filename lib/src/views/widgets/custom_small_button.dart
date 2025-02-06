import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSmallButton extends StatelessWidget {
  Function() ontap;
  Color textColor;
  Color backGroundColor;
  double horizontal;

  double width;
  double textSize;
  String titleText;
  double borderRadius;
  CustomSmallButton({
    required this.ontap,
    this.textColor = AppColors.white,
    this.backGroundColor = AppColors.primaryBlack,
    this.horizontal = 12,
    this.width = 25,
    this.textSize = 14,
    this.borderRadius = 12,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: 7),
        width: width.w,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
            child: Text(
          titleText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 12.sp, color: AppColors.textWhiteColor),
        )),
      ),
    );
  }
}
