import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/views/screens/authentication/login_page.dart';
import 'package:colab/src/views/screens/authentication/splash_screen.dart';
import 'package:colab/src/views/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      ]);
}
