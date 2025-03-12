import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FuturePermits extends StatefulWidget {
  const FuturePermits({super.key});

  @override
  State<FuturePermits> createState() => _FuturePermitsState();
}

class _FuturePermitsState extends State<FuturePermits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                          .copyWith(color: AppColors.textBlackColor),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  PopupMenuButton(
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
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
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlackColor),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
