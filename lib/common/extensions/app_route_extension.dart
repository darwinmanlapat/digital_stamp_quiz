import 'package:digital_stamp_quiz/common/router/app_route.dart';

extension AppRouteX on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.splash:
        return '/splash';
      case AppRoute.dashboard:
        return '/dashboard';
      case AppRoute.quiz:
        return 'quiz';
      default:
        return '/';
    }
  }

  String get name {
    switch (this) {
      case AppRoute.splash:
        return 'splash';
      case AppRoute.quiz:
        return 'quiz';
      case AppRoute.dashboard:
        return 'dashboard';
      default:
        return '/';
    }
  }
}
