import 'dart:io';

import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PickedImages {
 static Future<File?> showImagePickerOptions(
    BuildContext context, {
    required Function(String?) onPick,
  }) async {
    File? file;
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 18.h,
          width: 100.w,
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text("Upload Images",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();
                      try {
                        file = await captureImageWithCamera();
                      } catch (e) {
                        print("Error capturing image: $e");
                      }
                    },
                    child: Container(
                      height: 11.h,
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.black),
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColors.white,
                                size: 20.sp,
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text("Take Picture",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();
                      try {
                        file = await pickImageFromGallery();
                        if (file != null) {
                          infoLog("Selected file path: ${file!.path}");
                          onPick(file!.path);
                        }
                      } catch (e) {
                        print("Error picking image: $e");
                      }
                    },
                    child: Container(
                      height: 11.h,
                      width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.black),
                              child: Icon(Icons.photo, color: AppColors.white)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "From Gallery",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}