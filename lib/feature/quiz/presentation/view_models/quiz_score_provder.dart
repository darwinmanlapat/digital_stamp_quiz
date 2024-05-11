import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizScore extends StateNotifier<int> {
  QuizScore() : super(0);

  void incrementScore() {
    state++;
  }

  void resetScore() {
    state = 0;
  }

  void setHighScoreRecord() {
    // read data from hive
    // if no recorded data, save the data
    // if there is a recorded data, compare the current state and the stored data
    // save the state if its higher from the previous 
  }
}

final quizScoreStateNotifier =
    StateNotifierProvider.autoDispose<QuizScore, int>((ref) => QuizScore());
