import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_category_entity.dart';

abstract class QuizRepository {
  Future<List<QuizCategory>> getQuizCategories();

  Future<DigitalStamp> getDigitalStampPerCategory(String categoryname);

  Future<void> updateQuizStampsPerCategory(
    String categoryName,
    int questionIndex,
  );

  Future<void> resetQuizStampsPerCategory(String categoryName);
}
