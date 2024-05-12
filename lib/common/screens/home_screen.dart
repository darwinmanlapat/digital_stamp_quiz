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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Mechanics",
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                color: Colors.black,
                              ),
                            ),
                            content: const Text(
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                "Select a quiz category and collect stamps for every correct answer."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: context.pop,
                                child: const Text(
                                  "Close",
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
