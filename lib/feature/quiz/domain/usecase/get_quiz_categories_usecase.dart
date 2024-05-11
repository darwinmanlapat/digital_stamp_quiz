import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_category_entity.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';

class GetQuizCategoriesUseCase {
  const GetQuizCategoriesUseCase({
    required QuizRepository repository,
  }) : _repository = repository;

  final QuizRepository _repository;

  Future<List<QuizCategory>> call() {
    return _repository.getQuizCategories();
  }
}
