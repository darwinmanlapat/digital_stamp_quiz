import 'package:digital_stamp_quiz/common/extensions/app_route_extension.dart';
import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/common/screens/splash_screen.dart';
import 'package:digital_stamp_quiz/feature/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoute.splash.path,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      name: AppRoute.splash.name,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.dashboard.path,
      name: AppRoute.dashboard.name,
      builder: (_, __) => const DashboardScreen(),
    ),
  ],
);
