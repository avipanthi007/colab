import 'package:colab/core/theme/colors.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/views/screens/dashboard/my_task.dart';
import 'package:colab/src/views/screens/dashboard/my_tools.dart';
import 'package:colab/src/views/screens/dashboard/permits/expired.dart';
import 'package:colab/src/views/screens/dashboard/permits/future.dart';
import 'package:colab/src/views/screens/dashboard/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class PermitsTab extends StatefulWidget {
  const PermitsTab({super.key});

  @override
  State<PermitsTab> createState() => _PermitsTabState();
}

class _PermitsTabState extends State<PermitsTab> with TickerProviderStateMixin {
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
        toolbarHeight: 16.h,
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
                  "Permits",
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
                          text: "Future",
                        ),
                        Tab(
                          text: "Current",
                        ),
                        Tab(
                          text: "Expired",
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: Text("0"),
                      ),
                      CircleAvatar(
                        child: Text("0"),
                      ),
                      CircleAvatar(
                        child: Text("498"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [FuturePermits(), MyTools(), ExpiredPermits()]),
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
