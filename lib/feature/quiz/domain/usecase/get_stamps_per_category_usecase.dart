import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';

class GetStampsPerCategoryUseCase {
  const GetStampsPerCategoryUseCase({
    required QuizRepository repository,
  }) : _repository = repository;

  final QuizRepository _repository;

  Future<DigitalStamp> call(String categoryName) {
    return _repository
        .getDigitalStampPerCategory(categoryName);
  }
}
