import 'dart:async';

import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/common/widgets/quiz_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer(
        const Duration(seconds: 3),
        () => context.goNamed(AppRoute.home.name),
      );
      return null;
    }, []);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: QuizColor.primary,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Lottie.asset(
              //   'assets/lotties/its_a_quiz.lottie',
              //   decoder: LottieUtils.customDecoder,
              // ),
              Positioned.fill(
                child: Image.asset(
                  'assets/images/quiz_time.png',
                ),
              ),
              const Positioned(
                bottom: 100,
                child: QuizLoadingIndicator(
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
