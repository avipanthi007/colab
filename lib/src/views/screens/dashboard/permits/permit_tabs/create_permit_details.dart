import 'dart:developer';
import 'dart:io';
import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/imageConstant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/models/permit_config_model.dart';
import 'package:colab/src/views/widgets/create_permit_helper.dart';
import 'package:colab/src/views/widgets/create_permit_rcolumn_ui.dart';
import 'package:colab/src/views/widgets/custom_button.dart';
import 'package:colab/src/views/widgets/picked_images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class CreatePermitDetails extends StatefulWidget {
  PermitConfigData data;
  CreatePermitDetails({super.key, required this.data});
  @override
  State<CreatePermitDetails> createState() => _CreatePermitDetailsState();
}

class _CreatePermitDetailsState extends State<CreatePermitDetails> {
  final permitController = Get.find<PermitsController>();

  RxBool switchValue = false.obs;
  final formKey = GlobalKey<FormState>();

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
          "Create Permit",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Form(
        key: formKey,
        child: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Column(
                children: [
                  CreatePermitRcolumnUi(
                    data: widget.data,
                  ),
                  buildPermitDateSection(),
                  buildPermitTimeSection(),
                  buildContractorSection(),
                  buildApproversSection(),
                  dropDownRow(context,
                      title: permitController.subsubLocationName.value.isEmpty
                          ? "Select Location"
                          : "${permitController.locationName.value}/${permitController.subLocationName.value}/${permitController.subsubLocationName.value}",
                      ontap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 50,
                                  height: 5,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                child: Text(
                                  "Select Location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Obx(() => ListView.builder(
                                      itemCount:
                                          permitController.locationList.length,
                                      itemBuilder: (context, index) {
                                        var location = permitController
                                            .locationList[index];

                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.5.h, horizontal: 2.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightBackground,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              location.locationName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16),
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                ),
                                                builder: (subContext) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            width: 50,
                                                            height: 5,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(Icons
                                                                  .arrow_back_ios),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    subContext);
                                                              },
                                                            ),
                                                            Text(
                                                              location
                                                                  .locationName,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headlineSmall!
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.sp,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                            child: location
                                                                    .subLocations
                                                                    .isEmpty
                                                                ? Center(
                                                                    child: Text(
                                                                      "No Sub Locations Available",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium,
                                                                    ),
                                                                  )
                                                                : ListView
                                                                    .builder(
                                                                    itemCount: location
                                                                        .subLocations
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            subIndex) {
                                                                      var subLocation =
                                                                          location
                                                                              .subLocations[subIndex];
                                                                      return Container(
                                                                        margin: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                0.5.h,
                                                                            horizontal: 2.w),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              AppColors.lightBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            ExpansionTile(
                                                                          title:
                                                                              Text(
                                                                            subLocation.subLocationName ??
                                                                                'Sub Location',
                                                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                                                  fontSize: 16.sp,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          children: subLocation.subSubLocations.isEmpty
                                                                              ? [
                                                                                  ListTile(
                                                                                    title: Text(
                                                                                      "No Sub-Sub Locations",
                                                                                      style: Theme.of(context).textTheme.bodySmall,
                                                                                    ),
                                                                                  )
                                                                                ]
                                                                              : subLocation.subSubLocations.map((subSubLocation) {
                                                                                  return ListTile(
                                                                                    leading: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: AppColors.black,
                                                                                        borderRadius: BorderRadius.circular(12),
                                                                                      ),
                                                                                      padding: EdgeInsets.all(10),
                                                                                      child: Icon(
                                                                                        Icons.home,
                                                                                        color: AppColors.white,
                                                                                        size: 20,
                                                                                      ),
                                                                                    ),
                                                                                    title: Text(
                                                                                      subSubLocation.subSubLocationName ?? 'Sub-Sub Location',
                                                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                                                    ),
                                                                                    onTap: () {
                                                                                      permitController.locationName.value = location.locationName;
                                                                                      permitController.subLocationName.value = subLocation.subLocationName ?? "";
                                                                                      permitController.subsubLocationName.value = subSubLocation.subSubLocationName ?? "";
                                                                                      widget.data.locationId.value = location.locationId;
                                                                                      widget.data.subLocationId.value = subLocation.subLocId ?? 0;
                                                                                      widget.data.subSubLocationId.value = subSubLocation.subLocationId ?? 0;
                                                                                      infoLog("Location ID: ${location.locationId}${subLocation.subLocId}${subSubLocation.subLocationId}");
                                                                                      infoLog("Controller Location ID: ${widget.data.locationId}${widget.data.subLocationId}${widget.data.subSubLocationId}");

                                                                                      subContext.pop();
                                                                                      context.pop();
                                                                                    },
                                                                                  );
                                                                                }).toList(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  )),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                  dropDownRow(context,
                      title: permitController.activityName.value.isEmpty
                          ? "Select Activity Head"
                          : "${permitController.activityHeadName.value}/${permitController.activityName.value}",
                      ontap: () {
                    widget.data.locationId == 0
                        ? CustomToast.customToast(
                            "Please Select Location/Sub Location")
                        : showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return permitController.activityHeadList.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Activity Available",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: permitController
                                          .activityHeadList.length,
                                      itemBuilder: (context, subIndex) {
                                        var act = permitController
                                            .activityHeadList[subIndex];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.5.h, horizontal: 2.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightBackground,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ExpansionTile(
                                            title: Text(
                                              act.activityHead,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            children: act.linkingData.isEmpty
                                                ? [
                                                    ListTile(
                                                      title: Text(
                                                        "No Linkink Activity",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    )
                                                  ]
                                                : List.generate(
                                                    act.linkingData.length,
                                                    (actIndex) {
                                                    final linkAct = act
                                                        .linkingData[actIndex];

                                                    if (linkAct.subLocationId ==
                                                        widget
                                                            .data
                                                            .subSubLocationId
                                                            .value) {
                                                      return ListTile(
                                                        leading: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Image.asset(
                                                              Imageconstant
                                                                  .progress,
                                                              height: 3.h,
                                                              color: AppColors
                                                                  .white,
                                                            )),
                                                        title: Text(
                                                          act
                                                              .linkingData[
                                                                  actIndex]
                                                              .activity,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        ),
                                                        onTap: () {
                                                          permitController
                                                                  .activityId
                                                                  .value =
                                                              act
                                                                  .linkingData[
                                                                      actIndex]
                                                                  .linkingActivityId;
                                                          permitController
                                                                  .activityHeadId
                                                                  .value =
                                                              act.activityId;

                                                          permitController
                                                                  .activityHeadName
                                                                  .value =
                                                              act.activityHead;
                                                          permitController
                                                                  .activityName
                                                                  .value =
                                                              act
                                                                  .linkingData[
                                                                      actIndex]
                                                                  .activity;

                                                          widget
                                                                  .data
                                                                  .getActivityId
                                                                  ?.value =
                                                              act
                                                                  .linkingData[
                                                                      actIndex]
                                                                  .linkingActivityId;
                                                          widget
                                                                  .data
                                                                  .getActivityHeadId
                                                                  ?.value =
                                                              act.activityId;
                                                          context.pop();
                                                        },
                                                      );
                                                    } else {
                                                      return SizedBox();
                                                    }
                                                  }),
                                          ),
                                        );
                                      },
                                    );
                            });
                  }),
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
                            widget.data.permitSectionInfo.first.sectionName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.white, fontSize: 17.sp),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.data.permitSectionInfo.length,
                          itemBuilder: (context, sectionIndex) {
                            final sectionData =
                                widget.data.permitSectionInfo[sectionIndex];

                            return Column(
                              children: List.generate(
                                sectionData.permitSectionLinkInfo.length,
                                (itemIndex) {
                                  final itemData = sectionData
                                      .permitSectionLinkInfo[itemIndex];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 0.8.h,
                                                horizontal: 2.w),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 1.h),
                                            height: 5.h,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.lightBackground,
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
                                          Obx(
                                            () => Switch(
                                                activeColor:
                                                    AppColors.primaryYellow,
                                                value: itemData
                                                    .hideCheckManually.value,
                                                onChanged: (val) {
                                                  itemData.hideCheckManually
                                                      .value = val;
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
                                            controller: itemData.userInput,
                                            onChanged: (value) {
                                              itemData.userInputTexts = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Remark";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Enter Your Remark",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: AppColors
                                                          .textGreyColor,
                                                      fontSize: 17.sp),
                                              suffixIcon: IconButton(
                                                  onPressed: () async {
                                                    await PickedImages
                                                        .showImagePickerOptions(
                                                            context,
                                                            onPick: (imgPath) {
                                                      itemData.imgUploaded
                                                              .value =
                                                          File(imgPath ?? "");
                                                    });
                                                    errorLog(itemData
                                                        .imgUploaded
                                                        .value!
                                                        .path);
                                                  },
                                                  icon: Icon(Icons.camera_alt)),
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
                                      Obx(
                                        () {
                                          if (itemData.imgUploaded.value ==
                                              null) {
                                            return SizedBox();
                                          }
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 0.8.h,
                                                horizontal: 2.w),
                                            height: 10.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Image.file(File(itemData
                                                .imgUploaded.value!.path)),
                                          );
                                        },
                                      ),
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
                  permitController.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              await permitController
                                  .triggerPermit(data: widget.data)
                                  .then((onValue) async {
                                await permitController.getPermitsCounts();
                              }).then((onValue) {
                                context.pop();
                                context.pop();
                              });
                            }
                          },
                          titleText: "Send For Approval",
                          borderRadius: 20,
                          backGroundColor: AppColors.primaryBlack,
                          textColor: AppColors.white,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPermitDateSection() {
    return kRepeatedPermitDataColumn(
      context,
      header: "Permit Date",
      rowTitle: widget.data.getPermitDate.isNotEmpty
          ? formatDate(widget.data.getPermitDate.value)
          : formatDate(DateTime.now().toString()),
      icon: Icons.calendar_month,
      iconTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2500),
        ).then((value) => widget.data.getPermitDate.value = value.toString());
      },
    );
  }

  Widget buildPermitTimeSection() {
    return Column(
      children: [
        kRepeatedPermitDataColumn(
          context,
          header: "Permit From",
          rowTitle: formatTime(widget.data.getStartTime.isNotEmpty
              ? widget.data.getStartTime.value
              : formatTime(TimeOfDay.now().format(context).toString())),
          icon: Icons.watch_later,
          iconTap: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((value) {
              if (value != null) {
                widget.data.getStartTime.value =
                    "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}";
              }
            });
          },
        ),
        Obx(() => kRepeatedPermitDataColumn(
              context,
              header: "Permit To",
              rowTitle: formatTime(widget.data.getEndTime.isNotEmpty
                  ? widget.data.getEndTime.value
                  : formatTime(TimeOfDay.now().format(context).toString())),
              icon: Icons.watch_later,
              iconTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  if (value != null) {
                    String formattedTime =
                        "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}";
                    permitController.permitTo.value = formattedTime;
                    widget.data.getEndTime.value = formattedTime;
                  }
                });
              },
            )),
      ],
    );
  }

  Widget buildContractorSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          buildContractorHeader(),
          SizedBox(height: 1.h),
          Column(
            children:
                List.generate(widget.data.permitTriggerLabours.length, (index) {
              return buildLabourItemRow(index);
            }),
          ),
          buildAddMoreButton(),
        ],
      ),
    );
  }

  Widget buildContractorHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.6.h),
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.primaryBlack,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Text("Contractor",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold)),
          buildContractorDropdown(),
        ],
      ),
    );
  }

  Widget buildContractorDropdown() {
    return Container(
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
                  ? permitController.contractorName.toString()
                  : "Choose Contractor",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.textGreyColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onPressed: () => showContractorBottomSheet(),
          ),
        ],
      ),
    );
  }

  void showContractorBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        height: 60.h,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(permitController.contractorDataList.length,
                (index) {
              return ListTile(
                title: Text(
                    permitController.contractorDataList[index].contractorName),
                onTap: () {
                  permitController.contractorName.value = permitController
                      .contractorDataList[index].contractorName
                      .toString();
                  widget.data.getContractorId.value =
                      permitController.contractorDataList[index].pid;
                  context.pop();
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildLabourItemRow(int index) {
    return Row(
      children: [
        buildLabourTypeDropdown(index),
        buildLabourQuantityField(index),
        buildDeleteLabourButton(index),
      ],
    );
  }

  Widget buildLabourTypeDropdown(int index) {
    return Container(
      height: 5.h,
      width: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 0.8.w),
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(width: 1.w),
          Obx(
            () => Text(
              widget.data.permitTriggerLabours[index].type.value.isEmpty
                  ? "Add Labour"
                  : "${widget.data.permitTriggerLabours[index].type.value}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.textGreyColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Spacer(),
          IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                _showLabourTypeBottomSheet(index);
              }),
        ],
      ),
    );
  }

  void _showLabourTypeBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        height: 40.h,
        child: Column(
          children: [
            Text("Select Labour Type",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: permitController.laboursList.length,
                itemBuilder: (context, listIndex) {
                  return ListTile(
                    title: Text(permitController.laboursList[listIndex].trade
                        .toString()),
                    onTap: () {
                      widget.data.permitTriggerLabours[index].type.value =
                          permitController.laboursList[listIndex].trade;
                      infoLog(
                          widget.data.permitTriggerLabours[index].type.value ??
                              'Null Hai');
                      context.pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabourQuantityField(int index) {
    return Container(
      height: 6.h,
      width: 18.w,
      margin: EdgeInsets.symmetric(horizontal: 0.6.h),
      decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: widget.data.permitTriggerLabours[index].labourInput!.value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: "0",
            contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
            border: InputBorder.none),
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget.data.permitTriggerLabours[index].quantity?.value =
                int.parse(value);
          }
        },
      ),
    );
  }

  Widget buildDeleteLabourButton(int index) {
    return Container(
      height: 6.h,
      margin: EdgeInsets.symmetric(horizontal: 0.6.h),
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => widget.data.permitTriggerLabours.removeAt(index),
        ),
      ),
    );
  }

  Widget buildAddMoreButton() {
    return Center(
      child: GestureDetector(
        onTap: () => widget.data.permitTriggerLabours.add(LabourItem()),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0.6.h),
          height: 5.h,
          width: 35.w,
          decoration: BoxDecoration(
              color: AppColors.primaryBlack,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text("Add More",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.white, fontSize: 16.sp)),
          ),
        ),
      ),
    );
  }

  Widget buildApproversSection() {
    return Column(
      children: [
        buildApproverDropdown(
          permitController.approverName,
        ),
        buildCoRequesterDropdown()
      ],
    );
  }

  Widget buildApproverDropdown(RxString value) {
    return kRepeatedPermitDataColumn(
      context,
      header: "Select Approvers",
      rowTitle: value.isEmpty ? "Select Individual" : value.toString(),
      icon: Icons.keyboard_arrow_down_sharp,
      color: AppColors.lightBackground,
      iconTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          height: 60.h,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(permitController.approversDataList.length,
                  (index) {
                return Obx(
                  () => ListTile(
                    title: Text(
                        "${permitController.approversDataList[index].firstName} ${permitController.approversDataList[index].lastName}"),
                    onTap: () {
                      value.value = permitController
                          .approversDataList[index].firstName
                          .toString();
                      context.pop();
                    },
                    trailing: Checkbox(
                        value: permitController
                            .approversDataList[index].approveCheckValue.value,
                        onChanged: (value) {
                          permitController.approversDataList[index]
                              .approveCheckValue.value = value!;

                          if (value) {
                            widget.data.permitApproveInfo.first.approversData
                                .add(permitController
                                    .approversDataList[index].id);
                          } else {
                            widget.data.permitApproveInfo.first.approversData
                                .remove(permitController
                                    .approversDataList[index].id);
                          }

                          log(widget.data.permitApproveInfo.first.approversData
                              .toString());
                        }),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCoRequesterDropdown() {
    return kRepeatedPermitDataColumn(
      context,
      header: "Select Co-Requester",
      rowTitle: "Select Individual",
      icon: Icons.keyboard_arrow_down_sharp,
      color: AppColors.lightBackground,
      iconTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          height: 60.h,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(permitController.approversDataList.length,
                  (index) {
                return Obx(
                  () => ListTile(
                    title: Text(
                        "${permitController.approversDataList[index].firstName} ${permitController.approversDataList[index].lastName}"),
                    onTap: () {
                      context.pop();
                    },
                    trailing: Checkbox(
                        value: permitController
                            .approversDataList[index].requesterCheckValue.value,
                        onChanged: (value) {
                          permitController.approversDataList[index]
                              .requesterCheckValue.value = value!;

                          if (value) {
                            widget.data.permitApproveInfo.first.coRequesterData
                                .add(permitController
                                    .approversDataList[index].id);
                          } else {
                            widget.data.permitApproveInfo.first.coRequesterData
                                .remove(permitController
                                    .approversDataList[index].id);
                          }

                          log(widget
                              .data.permitApproveInfo.first.coRequesterData
                              .toString());
                        }),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
