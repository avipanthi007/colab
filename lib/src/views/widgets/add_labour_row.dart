import 'package:colab/core/theme/colors.dart';
import 'package:colab/src/controllers/permits_controller.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/create_permit_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LabourRow extends StatelessWidget {
  final int index;
  final String labourItem;
  final PermitsController labourController;
  final BuildContext context;
  final int quantity;

  const LabourRow({
    Key? key,
    required this.index,
    required this.labourItem,
    required this.labourController,
    required this.context,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final permitController = Get.find<PermitsController>();
    return Container(
      key: ValueKey('labour_row_$index'),
      margin: EdgeInsets.only(bottom: 1.h),
      child: Row(
        children: [
          Container(
            height: 5.h,
            width: 50.w,
            padding: EdgeInsets.symmetric(horizontal: 0.8.w),
            margin: EdgeInsets.symmetric(horizontal: 2.h),
            decoration: BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  labourItem.isEmpty ? "Add Labour" : labourItem,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.textGreyColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.normal),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
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
                                      permitController.permitDataList.length,
                                      (index) {
                                    return ListTile(
                                      title: Text(permitController
                                          .laboursList[index].trade),
                                      onTap: () {
                                       
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
          Container(
            height: 6.h,
            width: 18.w,
            margin: EdgeInsets.symmetric(horizontal: 0.6.h),
            decoration: BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: TextEditingController(
                  text: quantity > 0
                      ? quantity.toString()
                      : ""),
              decoration: InputDecoration(
                hintText: "0",
                contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  try {
                    labourController.updateLabourQuantity(
                        index, int.parse(value));
                  } catch (e) {
                    // Handle parsing error
                  }
                } else {
                  labourController.updateLabourQuantity(index, 0);
                }
              },
            ),
          ),
          Container(
            height: 6.h,
            margin: EdgeInsets.symmetric(horizontal: 0.6.h),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    print('Deleting row at index: $index');
                    labourController.deleteLabourRow(index);
                  },
                  icon: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    );
  }

  Widget kRepeartedListTile({required String title}) {
    return GestureDetector(
      onTap: () {
        labourController.updateLabourType(index, title);
        context.pop();
      },
      child: Container(
        height: 6.h,
        margin: EdgeInsets.symmetric(vertical: 0.3.h),
        padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 2.w),
        decoration: BoxDecoration(
            color: AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.normal, fontSize: 17.sp),
        ),
      ),
    );
  }
}
