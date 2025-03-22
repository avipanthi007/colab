import 'package:colab/core/theme/colors.dart';
import 'package:colab/src/models/permit_config_model.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/widgets/create_permit_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreatePermitRcolumnUi extends StatelessWidget {
  final PermitConfigData data;

  const CreatePermitRcolumnUi({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    title: data.permitName.toString(),
                    subtitle: "Permit Name",
                    color: AppColors.white),
                kRepeatedColumn(context,
                    title: data.description.toString(),
                    subtitle: "Permit Description",
                    color: AppColors.white),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kRepeatedColumn(context,
                    title: data.permitType.toString(),
                    subtitle: "Permit Type",
                    color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
