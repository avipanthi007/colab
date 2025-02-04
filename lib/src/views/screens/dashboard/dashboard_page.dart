import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/imageConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  RxBool switchValue = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Switch(
              activeColor: AppColors.primaryYellow,
              value: switchValue.value,
              onChanged: (val) {
                switchValue.value = val;
              }),
        ),
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, The Lake Admin",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Last Sync -  6 Jan 2023  ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.textGreyColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 22.sp,
                    backgroundColor: AppColors.primaryYellow,
                    child: Image.asset(Imageconstant.colabUser),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "My Tools",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Spacer(),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
