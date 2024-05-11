import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/common/widgets/quiz_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/quiz_time.png',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  QuizCustomButton(
                    label: 'Play',
                    onPressed: () =>
                        context.goNamed(AppRoute.quizDashboard.name),
                    height: 60,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  QuizCustomButton.outlined(
                    label: 'About',
                    onPressed: () {},
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
