import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizLoadingIndicator extends StatelessWidget {
  const QuizLoadingIndicator({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      width: width,
      height: height,
      'assets/jsons/loading_indicator.json',
    );
  }
}
