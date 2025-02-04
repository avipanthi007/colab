import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  Function() ontap;
  Color textColor;
  Color backGroundColor;
  double horizontal;
  double height;
  double width;
  double textSize;
  String titleText;
  double borderRadius;
  CustomButton({
    required this.ontap,
    this.textColor = AppColors.white,
    this.backGroundColor = AppColors.primaryYellow,
    this.horizontal = 12,
    this.height = 6,
    this.width = 100,
    this.textSize = 14,
    this.borderRadius = 12,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: 7),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: backGroundColor,
            border: Border.all(color: AppColors.primaryYellow),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
            child: Text(
          titleText,
          style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
        )),
      ),
    );
  }
}
