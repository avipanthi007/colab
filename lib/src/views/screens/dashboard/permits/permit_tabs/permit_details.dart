import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/widgets/create_permit_helper.dart';
import 'package:colab/src/views/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class PermitDetails extends StatefulWidget {
  PermitData permitData;
  PermitDetails({super.key, required this.permitData});

  @override
  State<PermitDetails> createState() => _PermitDetailsState();
}

class _PermitDetailsState extends State<PermitDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Permits",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 1.h),
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
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: AppColors.primaryBlack,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: Text(
                            widget.permitData.subSubLocationName != null
                                ? "${widget.permitData.locationName.toString()}/${widget.permitData.subLocationName.toString()}/${widget.permitData.subSubLocationName.toString()}"
                                : TextConstant.user,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp),
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
                            widget.permitData.activityHead != null
                                ? "${widget.permitData.activityHead.toString()}/${widget.permitData.activity.toString()}"
                                : "Activity",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kRepeatedColumn(context,
                                  title:
                                      widget.permitData.permitName.toString(),
                                  subtitle: "Permit Name"),
                              kRepeatedColumn(context,
                                  title:
                                      widget.permitData.description.toString(),
                                  subtitle: "Permit Description"),
                            ],
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              kRepeatedColumn(context,
                                  title:
                                      widget.permitData.permitType.toString(),
                                  subtitle: "Permit Type"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.w,
                height: 28.h,
                padding: EdgeInsets.only(bottom: 1.h),
                margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kRepeatedColumn(context,
                              title: widget.permitData.permitName.toString(),
                              subtitle: "Triggered By"),
                          Spacer(),
                          SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kRepeatedColumn(context,
                              title: formatDate(
                                  widget.permitData.permitDate.toString()),
                              subtitle: "Permit Trigger Date"),
                          Spacer(),
                          kRepeatedColumn(context,
                              title: formatDate(
                                  widget.permitData.permitDate.toString()),
                              subtitle: "Permit Date"),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kRepeatedColumn(context,
                              title: formatTime(
                                  widget.permitData.startTime.toString()),
                              subtitle: "Permit From"),
                          Spacer(),
                          kRepeatedColumn(context,
                              title: formatTime(
                                  widget.permitData.endTime.toString()),
                              subtitle: "Permit To"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 1.h),
                margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    blackHeader(context,
                        title: widget.permitData.contractorName.toString()),
                    widget.permitData.permitTriggerLabours.isEmpty
                        ? SizedBox()
                        : Column(
                            children: List.generate(
                                widget.permitData.permitTriggerLabours.length,
                                (labourIndex) {
                              final labours = widget
                                  .permitData.permitTriggerLabours[labourIndex];
                              return Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.8.h, horizontal: 2.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.h),
                                    height: 5.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      labours.trade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.black,
                                              fontSize: 17.sp),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.8.h, horizontal: 2.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.h),
                                    height: 5.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      labours.labourCount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.black,
                                              fontSize: 17.sp),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 1.h),
                margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    blackHeader(context, title: "Co-Requester"),
                    Column(
                      children: List.generate(
                        widget.permitData.permitUserRoleInfo.length,
                        (itemIndex) {
                          final itemData =
                              widget.permitData.permitUserRoleInfo[itemIndex];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.8.h, horizontal: 2.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.h),
                                    height: 5.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      itemData.firstName + itemData.lastName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.black,
                                              fontSize: 17.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      height: 5.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBlack,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: Text(
                        widget.permitData.permitTriggerSectionInfo.first
                            .sectionName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.white, fontSize: 17.sp),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          widget.permitData.permitTriggerSectionInfo.length,
                      itemBuilder: (context, sectionIndex) {
                        final sectionData = widget
                            .permitData.permitTriggerSectionInfo[sectionIndex];

                        return Column(
                          children: List.generate(
                            sectionData.permitTriggerSectionLinkInfo.length,
                            (itemIndex) {
                              final itemData = sectionData
                                  .permitTriggerSectionLinkInfo[itemIndex];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 0.8.h, horizontal: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        height: 5.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.lightBackground,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(
                                          itemData.question,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 17.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  DottedBorder(
                                      borderPadding: EdgeInsets.all(8),
                                      borderType: BorderType.RRect,
                                      color: AppColors.primaryYellow,
                                      strokeWidth: 1,
                                      dashPattern: [10, 5],
                                      radius: Radius.circular(12),
                                      child: TextFormField(
                                        readOnly: true,
                                        onChanged: (value) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Remark";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: itemData.questionManually,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color:
                                                      AppColors.textGreyColor,
                                                  fontSize: 17.sp),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      )),
                                  Divider(),
                                  SizedBox(
                                    height: 6.h,
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      height: 5.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBlack,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: Text(
                        "Approvers",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.white, fontSize: 17.sp),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        widget.permitData.permitApproverStatus.length,
                        (itemIndex) {
                          final itemData =
                              widget.permitData.permitApproverStatus[itemIndex];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.8.h, horizontal: 2.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.h),
                                    height: 5.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      itemData.firstName + itemData.lastName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.black,
                                              fontSize: 17.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              CustomButton(
                ontap: () {},
                titleText: "Pending",
                backGroundColor: AppColors.primaryYellow,
                textColor: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
