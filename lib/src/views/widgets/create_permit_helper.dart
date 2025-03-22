import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget kRepeatedPermitDataColumn(BuildContext context,
    {required String header,
    required String rowTitle,
    required IconData icon,
    Color color = AppColors.white,
    Function()? iconTap}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 2.h),
    decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          height: 5.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: AppColors.primaryBlack,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Text(
            header,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white, fontSize: 17.sp),
          ),
        ),
        Container(
          height: 5.h,
          width: 90.w,
          margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Text(
                rowTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.normal),
              ),
              Spacer(),
              IconButton(onPressed: iconTap, icon: Icon(icon))
            ],
          ),
        )
      ],
    ),
  );
}

Widget dropDownRow(BuildContext context,
    {required String title, Function()? ontap}) {
  return Container(
    height: 6.h,
    width: 90.w,
    margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.h),
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
    decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 17.sp, fontWeight: FontWeight.normal),
        ),
        Spacer(),
        IconButton(onPressed: ontap, icon: Icon(Icons.keyboard_arrow_down))
      ],
    ),
  );
}

Widget kRepeatedColumn(BuildContext context,
    {required String title, required String subtitle, double width = 40, Color color = AppColors.black}) {
  return Container(
    padding: EdgeInsets.all(10),
    width: width.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: color),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: color,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp),
        ),
      ],
    ),
  );
}
Container blackHeader(BuildContext context,{required String title}) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          height: 5.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: AppColors.primaryBlack,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12))),
          child: Text(
            title ?? TextConstant.permitName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white, fontSize: 17.sp),
          ),
        );
  }