import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/widgets/quiz_categories_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizDashboardScreen extends StatelessWidget {
  const QuizDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.home_filled,
                      color: QuizColor.secondary,
                    ),
                    iconSize: 32.0,
                    onPressed: () => context.goNamed(AppRoute.home.name),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Expanded(child: QuizCategoriesListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
