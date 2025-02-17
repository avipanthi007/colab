import 'package:colab/core/theme/colors.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class CreatePermitDetails extends StatefulWidget {
  PermitData data;

  CreatePermitDetails({super.key, required this.data});

  @override
  State<CreatePermitDetails> createState() => _CreatePermitDetailsState();
}

class _CreatePermitDetailsState extends State<CreatePermitDetails> {
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
      body: Padding(
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
          ],
        ),
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
