import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/models/permit_model.dart';
import 'package:colab/src/views/screens/authentication/login_page.dart';
import 'package:colab/src/views/screens/authentication/splash_screen.dart';
import 'package:colab/src/views/screens/bottom_bar.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/create_permit.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/create_permit_details.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/dynamic_list_update.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/future.dart';
import 'package:colab/src/views/screens/dashboard/permits/permit_tabs/permit_details.dart';
import 'package:colab/src/views/screens/dashboard/permits/permits_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/models/permit_config_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouting {
  static final GoRouter router = GoRouter(
      initialLocation: RoutePath.splashScreen,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: SplashScreen());
      },
      routes: [
        GoRoute(
            path: RoutePath.splashScreen,
            builder: (context, state) {
              return const SplashScreen();
            }),
        GoRoute(
            path: RoutePath.login,
            builder: (context, state) {
              return const LoginPage();
            }),
        GoRoute(
            path: RoutePath.bottomBar,
            builder: (context, state) {
              return const HomeBottomNavigationbar();
            }),
        GoRoute(
            path: RoutePath.permitTab,
            builder: (context, state) {
              return const PermitsTab();
            }),
        GoRoute(
            path: RoutePath.futurePermits,
            builder: (context, state) {
              return const FuturePermits();
            }),
        GoRoute(
            path: RoutePath.createPermit,
            builder: (context, state) {
              return const CreatePermit();
            }),
        GoRoute(
            path: RoutePath.createPermitDetails,
            builder: (context, state) {
              final permitData = state.extra as PermitConfigData;
              return CreatePermitDetails(
                data: permitData,
              );
            }),
        GoRoute(
            path: RoutePath.dynamicListUpdate,
            builder: (context, state) {
              return DynamicListUpdate();
            }),
        GoRoute(
            path: RoutePath.permitDetails,
            builder: (context, state) {
              final permitData = state.extra as PermitData;
              return PermitDetails(
                permitData: permitData,
              );
            }),
      ]);
}
