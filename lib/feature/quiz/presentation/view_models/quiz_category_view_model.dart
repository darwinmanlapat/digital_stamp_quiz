import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_category_entity.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/get_quiz_categories_usecase.dart';
import 'package:digital_stamp_quiz/injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizCategoryNotifier
    extends StateNotifier<AsyncValue<List<QuizCategory>>> {
  QuizCategoryNotifier({
    required GetQuizCategoriesUseCase getQuizCategoriesUseCase,
    AsyncValue<List<QuizCategory>>? state,
  })  : _getQuizCategoriesUseCase = getQuizCategoriesUseCase,
        super(state ?? const AsyncValue.loading());

  final GetQuizCategoriesUseCase _getQuizCategoriesUseCase;

  Future<void> getQuizCategories() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _getQuizCategoriesUseCase.call();
    });
  }
}

final quizCategoryNotifierProvider =
    StateNotifierProvider<QuizCategoryNotifier, AsyncValue<List<QuizCategory>>>(
        (_) {
  final getQuizCategoriesUseCase = locator.get<GetQuizCategoriesUseCase>();
  return QuizCategoryNotifier(
    getQuizCategoriesUseCase: getQuizCategoriesUseCase,
  );
});
