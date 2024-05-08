import 'dart:async';

import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer(
        const Duration(seconds: 3),
        () => context.goNamed(AppRoute.dashboard.name),
      );
      return null;
    }, []);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFFFFB534),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/its_a_quiz.lottie',
                decoder: LottieUtils.customDecoder,
              ),
              Positioned(
                bottom: 150,
                child: Lottie.asset(
                  height: 100,
                  width: 100,
                  'assets/jsons/loading_indicator.json',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
