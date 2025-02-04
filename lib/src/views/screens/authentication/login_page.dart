import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/imageConstant.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/src/controllers/auth_controller.dart';
import 'package:colab/src/views/widgets/customTextField.dart';
import 'package:colab/src/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Imageconstant.colablogo,
            height: 20.h,
            width: 50.w,
          ),
          Center(
            child: Card(
              elevation: 8,
              child: Container(
                width: 90.w,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      TextConstant.log_In,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          TextConstant.userName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBlack,
                                  fontSize: 14.px),
                        ),
                        Spacer()
                      ],
                    ),
                    CustomTextField(
                      margin: EdgeInsets.all(0),
                      controller: authcontroller.usernameController.value,
                      label: TextConstant.enterUserName,
                      //borderRadius: BorderRadius.circular(25),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          TextConstant.enterpassword,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBlack,
                                  fontSize: 14.px),
                        ),
                        Spacer()
                      ],
                    ),
                    CustomTextField(
                      margin: EdgeInsets.all(0),
                      controller: authcontroller.passwordController.value,
                      label: TextConstant.password,
                      //borderRadius: BorderRadius.circular(25),
                      suffix: Icon(Icons.remove_red_eye),
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          TextConstant.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBlack,
                                  fontSize: 14.px),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Obx(
                      () => authcontroller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              width: 50,
                              ontap: () async {
                                authcontroller.login();
                              },
                              titleText: TextConstant.login,
                              borderRadius: 25,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
