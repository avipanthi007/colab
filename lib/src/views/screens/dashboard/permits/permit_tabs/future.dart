import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/views/widgets/create_permit_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class FuturePermits extends StatefulWidget {
  const FuturePermits({super.key});

  @override
  State<FuturePermits> createState() => _FuturePermitsState();
}

class _FuturePermitsState extends State<FuturePermits> {
  final permitController = Get.find<PermitsController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      await getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => permitController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.grey),
                                  child: Text(
                                    "Show All",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: AppColors.textBlackColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                PopupMenuButton(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  itemBuilder: (context) => [
                                    repeatedPopup(title: "None"),
                                    repeatedPopup(title: "Name"),
                                    repeatedPopup(title: "Made By"),
                                    repeatedPopup(title: "Due Date"),
                                    repeatedPopup(title: "Last Update"),
                                    repeatedPopup(title: "Category"),
                                    repeatedPopup(title: "Priority"),
                                    repeatedPopup(title: "Assign To"),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Card(
                              elevation: 8,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 5.h,
                                width: 80.w,
                                child: Center(
                                    child: Text(
                                  "No Data Found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textBlackColor),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: permitController.permitFutureList.length,
                        itemBuilder: (context, index) {
                          final data = permitController.permitFutureList[index];
                          return GestureDetector(
                            onTap: () {
                              context.push(RoutePath.permitDetails,
                                  extra: data);
                            },
                            child: Container(
                              padding: EdgeInsets.only(bottom: 2.h),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 1.5.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                bottomRight:
                                                    Radius.circular(12))),
                                        child: Text(
                                          data.permitName?.toString() ??
                                              TextConstant.user,
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
                                                bottomLeft:
                                                    Radius.circular(12))),
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
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          kRepeatedColumn(context,
                                              width: 32,
                                              title:
                                                  formatDate(data.permitDate),
                                              subtitle:
                                                  TextConstant.permitDate),
                                          kRepeatedColumn(context,
                                              width: 32,
                                              title: formatTime(data.startTime),
                                              subtitle:
                                                  TextConstant.permitFrom),
                                          kRepeatedColumn(context,
                                              width: 32,
                                              title: formatTime(data.endTime),
                                              subtitle: TextConstant.permitTo),
                                        ],
                                      ),
                                      SizedBox(height: 1.h),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          kRepeatedColumn(context,
                                              width: 40,
                                              title:
                                                  "${data.triggerFirstName} ${data.triggerLastName}(${data.triggerUserDesignation})",
                                              subtitle:
                                                  TextConstant.requestedBy),
                                          kRepeatedColumn(context,
                                              width: 40,
                                              title: formatFullDateTime(
                                                  data.syncAt),
                                              subtitle:
                                                  TextConstant.triggeredAt),
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
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: AppColors.primaryYellow),
                                            child: Text(
                                              TextConstant.pending,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp),
                                            ),
                                          ),
                                          Spacer(),
                                          kRepeatedColumn(context,
                                              width: 50,
                                              title: "${data.contractorName}",
                                              subtitle:
                                                  TextConstant.contractor),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
      ),
    );
  }

  getData() async {
    await permitController.fetchFutureData();
  }
}
