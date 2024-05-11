import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/common/screens/splash_screen.dart';
import 'package:digital_stamp_quiz/common/screens/home_screen.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/screens/quiz_dashboard.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/screens/selected_quiz_screen.dart';
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
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoute.quizDashboard.path,
      name: AppRoute.quizDashboard.name,
      builder: (_, __) => const QuizDashboardScreen(),
      routes: [
        GoRoute(
          path: AppRoute.selectedQuiz.path,
          name: AppRoute.selectedQuiz.name,
          builder: (_, state) {
            final data = state.extra as Map<String, dynamic>;
            final quizzes = data['quizzes'];
            final categoryIndex = data['index'];

            return SelectedQuizScreen(
              quizzes: quizzes,
              categoryIndex: categoryIndex,
            );
          },
        ),
      ],
    ),
  ],
);
