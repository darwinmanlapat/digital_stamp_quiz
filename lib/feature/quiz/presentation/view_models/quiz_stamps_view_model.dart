import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/get_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/reset_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/update_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizStampsNotifier extends StateNotifier<AsyncValue<DigitalStamp>> {
  QuizStampsNotifier({
    required GetStampsPerCategoryUseCase getQuizStampsPerCategory,
    required UpdateStampsPerCategoryUseCase updateQuizStampsPerCategory,
    required ResetStampsPerCategoryUseCase resetQuizStampsPerCategory,
    AsyncValue<DigitalStamp>? state,
  })  : _getQuizStampsPerCategory = getQuizStampsPerCategory,
        _updateQuizStampsPerCategory = updateQuizStampsPerCategory,
        _resetQuizStampsPerCategory = resetQuizStampsPerCategory,
        super(state ?? const AsyncValue.loading());

  final GetStampsPerCategoryUseCase _getQuizStampsPerCategory;
  final UpdateStampsPerCategoryUseCase _updateQuizStampsPerCategory;
  final ResetStampsPerCategoryUseCase _resetQuizStampsPerCategory;

  Future<void> getQuizStampsPerCategory(String categoryName) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() {
      return _getQuizStampsPerCategory.call(categoryName);
    });
  }

  Future<void> updateQuizStampsPerCategory(
    String categoryName,
    int questionIndex,
  ) async {
    await _updateQuizStampsPerCategory.call(
      categoryName,
      questionIndex,
    );
  }

  Future<void> resetQuizStampsPerCategory(String categoryName) async {
    await _resetQuizStampsPerCategory.call(categoryName);
  }
}

final quizStampsNotifierProvider =
    StateNotifierProvider<QuizStampsNotifier, AsyncValue<DigitalStamp>>((_) {
  final getStampsPerCategoryUseCase =
      locator.get<GetStampsPerCategoryUseCase>();

  final updateStampsPerCategoryUseCase =
      locator.get<UpdateStampsPerCategoryUseCase>();

  final resetStampsPerCategoryUseCase =
      locator.get<ResetStampsPerCategoryUseCase>();
  return QuizStampsNotifier(
    resetQuizStampsPerCategory: resetStampsPerCategoryUseCase,
    getQuizStampsPerCategory: getStampsPerCategoryUseCase,
    updateQuizStampsPerCategory: updateStampsPerCategoryUseCase,
  );
});
