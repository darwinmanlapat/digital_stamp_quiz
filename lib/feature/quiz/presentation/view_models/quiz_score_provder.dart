import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizScore extends StateNotifier<int> {
  QuizScore() : super(0);

  void incrementScore() {
    state++;
  }

  void resetScore() {
    state = 0;
  }
}

final quizScoreStateNotifier =
    StateNotifierProvider.autoDispose<QuizScore, int>((ref) {
  return QuizScore();
});
