import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';

class ResetStampsPerCategoryUseCase {
  const ResetStampsPerCategoryUseCase({
    required QuizRepository repository,
  }) : _repository = repository;

  final QuizRepository _repository;

  Future<void> call(String categoryName) {
    return _repository.resetQuizStampsPerCategory(categoryName);
  }
}
