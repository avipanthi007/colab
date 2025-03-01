import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DynamicListUpdate extends StatefulWidget {
  const DynamicListUpdate({super.key});

  @override
  State<DynamicListUpdate> createState() => _DynamicListUpdateState();
}

class _DynamicListUpdateState extends State<DynamicListUpdate> {

  RxList<RowItems> updatableList = <RowItems>[].obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.lightBackground
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.5.w,vertical: 0.8.h),
                  child: Text("Choose Labour"),
                ),
                TextField(),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class RowItems {
  final String key;
  final int quantity;

  RowItems({required this.key, required this.quantity});

}