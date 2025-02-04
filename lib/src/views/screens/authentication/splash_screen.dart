import 'package:colab/core/utils/constants/imageConstant.dart';
import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Future<void> isLogin() async {
    try {
      final String? token = await LocalStorage.getToken("token");
     
      if (token == null || token.isEmpty) {
        context.go(RoutePath.login);
      } else {
        print("----->token :$token");
        context.go(RoutePath.bottomBar);
      }
    } catch (e) {
      debugPrint('Error checking login status: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Imageconstant.colablogo,
          height: 20.h,
          width: 50.w,
        ),
      ),
    );
  }
}
