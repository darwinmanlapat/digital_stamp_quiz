import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/data/sources/local/quiz_local_source.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_category_entity.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  const QuizRepositoryImpl({
    required QuizLocalSource localSource,
  }) : _localSource = localSource;

  final QuizLocalSource _localSource;

  @override
  Future<List<QuizCategory>> getQuizCategories() {
    return _localSource.getQuizCategories();
  }

  @override
  Future<void> updateQuizStampsPerCategory(
      String categoryName, int questionIndex) {
    return _localSource.updateQuizStampsPerCategory(
        categoryName, questionIndex);
  }

  @override
  Future<DigitalStamp> getDigitalStampPerCategory(String categoryname) {
    return _localSource.getDigitalStampPerCategory(categoryname);
  }

  @override
  Future<void> resetQuizStampsPerCategory(String categoryName) {
    return _localSource.resetQuizStampsPerCategpry(categoryName);
  }
}
