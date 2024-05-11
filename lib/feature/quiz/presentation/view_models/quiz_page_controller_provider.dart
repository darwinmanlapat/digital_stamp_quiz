import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizPageController extends StateNotifier<PageController> {
  QuizPageController() : super(PageController(initialPage: 0));

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}

final quizPageControllerStateNotifierProvider =
    StateNotifierProvider<QuizPageController, PageController>(
        (ref) => QuizPageController());
