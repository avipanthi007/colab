import 'dart:io';

import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/services/routing/routing.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/widgets/add_labour_row.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CreatePermitDetails extends StatefulWidget {
  PermitData data;

  CreatePermitDetails({super.key, required this.data});

  @override
  State<CreatePermitDetails> createState() => _CreatePermitDetailsState();
}

class _CreatePermitDetailsState extends State<CreatePermitDetails> {
  final permitController = Get.find<PermitsController>();

  final dobController = TextEditingController();
  RxBool switchValue = false.obs;
  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 18.h,
          width: 100.w,
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text("Upload Images",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      permitController.captureImageWithCamera();
                    },
                    child: Container(
                      height: 11.h,
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.black),
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColors.white,
                                size: 20.sp,
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text("Take Picture",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      permitController.pickImageFromGallery();
                    },
                    child: Container(
                      height: 11.h,
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.black),
                              child: Icon(Icons.photo, color: AppColors.white)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "From Gallery",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: GestureDetector(
          onTap: () {
            context.push(RoutePath.dynamicListUpdate);
          },
          child: Text(
            "Create Permit",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryBlack),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kRepeatedColumn(context,
                                title: widget.data.permitName.toString(),
                                subtitle: "Permit Name"),
                            kRepeatedColumn(context,
                                title: widget.data.description.toString(),
                                subtitle: "Permit Description"),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            kRepeatedColumn(context,
                                title: widget.data.permitType.toString(),
                                subtitle: "Permit Type"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                kRepeatedPermitDataColumn(context,
                    header: "Permit Date",
                    rowTitle: formatDate(widget.data.permitDate.toString()),
                    icon: Icons.calendar_month, iconTap: () async {
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2500))
                      .then((value) =>
                          dobController.text = formatDate(value.toString()));
                }),
                kRepeatedPermitDataColumn(context, iconTap: () {
                  showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                },
                    header: "Permit From",
                    rowTitle: formatTime(widget.data.startTime.toString()),
                    icon: Icons.watch_later),
                kRepeatedPermitDataColumn(context,
                    header: "Permit To",
                    rowTitle: formatTime(widget.data.endTime.toString()),
                    icon: Icons.watch_later, iconTap: () {
                  showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                }),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 0.6.h),
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.primaryBlack,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: Column(
                          children: [
                            Text(
                              "Contractor",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: AppColors.white,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 0.8.w),
                              margin: EdgeInsets.symmetric(horizontal: 2.h),
                              decoration: BoxDecoration(
                                  color: AppColors.lightBackground,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      permitController.contractorName.isNotEmpty
                                          ? permitController.contractorName
                                              .toString()
                                          : "Choose Contractor",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.textGreyColor,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                height: 60.h,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: List.generate(
                                                        permitController
                                                            .contractorDataList
                                                            .length, (index) {
                                                      return ListTile(
                                                        title: Text(permitController
                                                            .contractorDataList[
                                                                index]
                                                            .contractorName),
                                                        onTap: () {
                                                          permitController
                                                                  .contractorName
                                                                  .value =
                                                              permitController
                                                                  .contractorDataList[
                                                                      index]
                                                                  .contractorName
                                                                  .toString();
                                                          infoLog(
                                                              permitController
                                                                  .contractorName
                                                                  .toString());
                                                          context.pop();
                                                        },
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Obx(() => Column(
                            children: List.generate(
                                permitController.labourItems.length, (index) {
                              return Row(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 50.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.8.w),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Obx(() => Text(
                                              permitController
                                                      .labourItems[index]
                                                      .type
                                                      .isEmpty
                                                  ? "Add Labour"
                                                  : permitController
                                                      .labourItems[index].type,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: AppColors
                                                          .textGreyColor,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            )),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              // Show labor type selection
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w,
                                                              vertical: 1.h),
                                                      height: 40.h,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Select Labour Type",
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Expanded(
                                                            child: ListView(
                                                              children: List.generate(
                                                                  permitController
                                                                      .laboursList
                                                                      .length,
                                                                  (listIndex) {
                                                                return ListTile(
                                                                  title: Text(permitController
                                                                      .laboursList[
                                                                          listIndex]
                                                                      .trade),
                                                                  onTap: () {
                                                                    permitController.updateLabourType(
                                                                        index,
                                                                        permitController
                                                                            .laboursList[listIndex]
                                                                            .trade);
                                                                    context
                                                                        .pop();
                                                                  },
                                                                );
                                                              }),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon:
                                                Icon(Icons.keyboard_arrow_down))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 6.h,
                                    width: 18.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.6.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "0",
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          permitController.updateLabourQuantity(
                                              index, int.parse(value));
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 6.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.6.h),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () => permitController
                                              .deleteLabourRow(index),
                                          icon: Icon(Icons.delete)),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )),
                      Center(
                        child: GestureDetector(
                          onTap: () => permitController.addLabourRow(),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 0.6.h),
                            height: 5.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryBlack,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                "Add More",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: AppColors.white,
                                        fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                kRepeatedPermitDataColumn(context, iconTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          height: 60.h,
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  permitController.approversDataList.length,
                                  (index) {
                                return ListTile(
                                  title: Text(
                                      "${permitController.approversDataList[index].firstName}${permitController.approversDataList[index].lastName}"),
                                  onTap: () {
                                    permitController.approverName.value =
                                        permitController
                                            .approversDataList[index].firstName
                                            .toString();
                                    infoLog(permitController.approverName
                                        .toString());
                                    context.pop();
                                  },
                                );
                              }),
                            ),
                          ),
                        );
                      });
                },
                    header: "Select Approvers",
                    rowTitle: permitController.approverName.isEmpty
                        ? "Select Individual"
                        : permitController.approverName.toString(),
                    icon: Icons.keyboard_arrow_down_sharp,
                    color: AppColors.lightBackground),
                kRepeatedPermitDataColumn(context, iconTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          height: 60.h,
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  permitController.approversDataList.length,
                                  (index) {
                                return ListTile(
                                  title: Text(
                                      "${permitController.approversDataList[index].firstName}${permitController.approversDataList[index].lastName}"),
                                  onTap: () {
                                    permitController.coRequesterName.value =
                                        permitController
                                            .approversDataList[index].firstName
                                            .toString();
                                    infoLog(permitController.coRequesterName
                                        .toString());
                                    context.pop();
                                  },
                                );
                              }),
                            ),
                          ),
                        );
                      });
                },
                    header: "Select Co-Requesters",
                    rowTitle: permitController.coRequesterName.isEmpty
                        ? "Select Individual"
                        : permitController.coRequesterName.toString(),
                    icon: Icons.keyboard_arrow_down_sharp,
                    color: AppColors.lightBackground),
                dropDownRow(context, title: "Select Location", ontap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          height: 60.h,
                          color: AppColors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Select Location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 18.sp),
                                ),
                                Column(
                                  children: List.generate(
                                      permitController.locationList.length,
                                      (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        permitController.locationName.value =
                                            permitController.locationList[index]
                                                .locationName
                                                .toString();
                                        infoLog(permitController.locationName
                                            .toString());
                                        context.pop();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 0.8.h),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.5.h, horizontal: 3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.lightBackground),
                                        child: Row(
                                          children: [
                                            Text(
                                              permitController
                                                  .locationList[index]
                                                  .locationName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 17,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
                dropDownRow(context, title: "Select Activity Head"),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.primaryBlack,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: Text(
                          "dfg",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.white, fontSize: 17.sp),
                        ),
                      ),
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
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "dfg",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: AppColors.white, fontSize: 17.sp),
                            ),
                          ),
                          Obx(
                            () => Switch(
                                activeColor: AppColors.primaryYellow,
                                value: switchValue.value,
                                onChanged: (val) {
                                  switchValue.value = val;
                                }),
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
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    showImagePickerOptions(context);
                                  },
                                  icon: Icon(Icons.camera_alt)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )),
                      Divider(),
                      SizedBox(
                        height: 6.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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

  Container kRepeatedPermitDataColumn(BuildContext context,
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
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
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

  SizedBox kRepeatedColumn(BuildContext context,
      {required String title, required String subtitle, double width = 40}) {
    return SizedBox(
      width: width.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class LabourItem {
  String type;
  int quantity;

  LabourItem({required this.type, required this.quantity});
}
