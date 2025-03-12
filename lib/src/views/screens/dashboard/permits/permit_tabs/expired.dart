import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExpiredPermits extends StatefulWidget {
  const ExpiredPermits({super.key});

  @override
  State<ExpiredPermits> createState() => _ExpiredPermitsState();
}

class _ExpiredPermitsState extends State<ExpiredPermits> {
  final permitController = Get.find<PermitsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: permitController.permitDataList.length,
            itemBuilder: (context, index) {
              final data = permitController.permitDataList[index];
              return Container(
                padding: EdgeInsets.only(bottom: 2.h),
                margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.6.h, horizontal: 4.w),
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.primaryBlack,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: Text(
                            data.permitName?.toString() ?? "user",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.6.h, horizontal: 6.w),
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: AppColors.textGreyColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            "ID: PER${data.id}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kRepeatedColumn(context,
                                  title: formatDate(data.permitDate?.value),
                                  subtitle: "Permit Date"),
                              kRepeatedColumn(context,
                                  title: formatTime(data.startTime),
                                  subtitle: "Permit From"),
                              kRepeatedColumn(context,
                                  title: formatTime(data.endTime),
                                  subtitle: "Permit To"),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kRepeatedColumn(context,
                                  width: 40,
                                  title:
                                      "${data.triggerFirstName} ${data.triggerLastName}(${data.triggerUserDesignation})",
                                  subtitle: "Requested By"),
                              kRepeatedColumn(context,
                                  width: 40,
                                  title: formatFullDateTime(data.syncAt),
                                  subtitle: "Triggered At"),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.primaryYellow),
                                child: Text(
                                  "Pending",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                ),
                              ),
                              Spacer(),
                              kRepeatedColumn(context,
                                  width: 50,
                                  title: "${data.contractorName}",
                                  subtitle: "Contractor"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  SizedBox kRepeatedColumn(BuildContext context,
      {required String title, required String subtitle, double width = 28}) {
    return SizedBox(
      width: width.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.textGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
