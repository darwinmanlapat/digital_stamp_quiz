import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';

class UpdateStampsPerCategoryUseCase {
  const UpdateStampsPerCategoryUseCase({
    required QuizRepository repository,
  }) : _repository = repository;

  final QuizRepository _repository;

  Future<void> call(String categoryName, int questionIndex) {
    return _repository.updateQuizStampsPerCategory(categoryName, questionIndex);
  }
}
