import 'package:digital_stamp_quiz/common/router/app_route.dart';

extension AppRouteX on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.splash:
        return '/splash';
      case AppRoute.home:
        return '/home';
      case AppRoute.quizDashboard:
        return '/dashboard';
      case AppRoute.selectedQuiz:
        return 'quiz/:id';

      default:
        return '/';
    }
  }

  String get name {
    switch (this) {
      case AppRoute.splash:
        return 'splash';
      case AppRoute.home:
        return 'home';
      case AppRoute.quizDashboard:
        return 'quiz-dashboard';
      case AppRoute.selectedQuiz:
        return 'selected-quiz';
      default:
        return '/';
    }
  }
}
