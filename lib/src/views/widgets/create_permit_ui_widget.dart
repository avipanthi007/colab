import 'package:colab/core/theme/colors.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class CreatePermitUiWidget extends StatelessWidget {
  PermitData data;
  CreatePermitUiWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: AppColors.primaryBlack,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Text(
              data.permitName.toString() ?? "Permit Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.white, fontSize: 17.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(
                  height: 1.5.h,
                ),
                DottedBorder(
                    borderType: BorderType.RRect,
                    color: AppColors.primaryYellow,
                    strokeWidth: 1,
                    dashPattern: [10, 5],
                    radius: Radius.circular(12),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      width: 100.w,
                      height: 6.h,
                      child: Text(
                        data.description.toString() ?? "Description",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    )),
                SizedBox(
                  height: 1.5.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.push(RoutePath.createPermitDetails, extra: data);
                    },
                    child: Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBlack,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          "Add Permit",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.white, fontSize: 17.sp),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
