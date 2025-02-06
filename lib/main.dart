import 'package:colab/core/theme/theme.dart';
import 'package:colab/core/utils/injection.dart';
import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initSharedPref();
  GoRouter router = AppRouting.router;
  await dotenv.load(fileName: ".env");
  DependencyInjector.inject();
  navigatorKey.currentContext;
  runApp(MyApp(
    route: router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter route;
  const MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (buildContext, orientation, screenType) {
      return GetMaterialApp.router(
        
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerDelegate: AppRouting.router.routerDelegate,
        routeInformationParser: AppRouting.router.routeInformationParser,
        routeInformationProvider: AppRouting.router.routeInformationProvider,
      );
    });
  }
}
