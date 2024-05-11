import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/get_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizStampsNotifier extends StateNotifier<AsyncValue<DigitalStamp>> {
  QuizStampsNotifier({
    required GetStampsPerCategoryUseCase getQuizStampsPerCategory,
    AsyncValue<DigitalStamp>? state,
  })  : _getQuizStampsPerCategory = getQuizStampsPerCategory,
        super(state ?? const AsyncValue.loading());

  final GetStampsPerCategoryUseCase _getQuizStampsPerCategory;

  Future<void> getQuizStampsPerCategory(String categoryName) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() {
      return _getQuizStampsPerCategory.call(categoryName);
    });
  }
}

final quizStampsNotifierProvider =
    StateNotifierProvider<QuizStampsNotifier, AsyncValue<DigitalStamp>>(
        (_) {
  final getStampsPerCategoryUseCase =
      locator.get<GetStampsPerCategoryUseCase>();
  return QuizStampsNotifier(
    getQuizStampsPerCategory: getStampsPerCategoryUseCase,
  );
});
