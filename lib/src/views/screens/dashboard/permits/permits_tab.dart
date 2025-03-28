import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/views/screens/dashboard/my_tools.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/current.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/expired.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/future.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class PermitsTab extends StatefulWidget {
  const PermitsTab({super.key});

  @override
  State<PermitsTab> createState() => _PermitsTabState();
}

class _PermitsTabState extends State<PermitsTab> with TickerProviderStateMixin {
  final permitController = Get.find<PermitsController>();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 18.h,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Text(
                  TextConstant.permits,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: TabBar(
                      labelStyle: TextStyle(color: Colors.white),
                      indicator: BoxDecoration(
                          color: AppColors.primaryYellow,
                          borderRadius: BorderRadius.circular(25)),
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: TextConstant.future,
                        ),
                        Tab(
                          text: TextConstant.current,
                        ),
                        Tab(
                          text: TextConstant.expired,
                        ),
                      ]),
                ),
                Obx(
                  () => permitController.permitCounts.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 4.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBlack,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    permitController
                                        .permitCounts.first.futureCount
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                              Container(
                                height: 4.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBlack,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    permitController
                                        .permitCounts.first.currentCount
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                              Container(
                                height: 4.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBlack,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    permitController
                                        .permitCounts.first.expiredCount
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        FuturePermits(),
        CurrentPermits(),
        ExpiredPermits(),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlack,
        onPressed: () {
          context.push(RoutePath.createPermit);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
