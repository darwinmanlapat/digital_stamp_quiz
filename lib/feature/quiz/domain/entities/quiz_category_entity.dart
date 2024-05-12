import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_entity.dart';

class QuizCategory {
  final int id;
  final String name;
  final String image;
  final int quizCount;
  final DigitalStamp digitalStamp;
  final List<Quiz> quizzes;

  QuizCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.quizCount,
    required this.digitalStamp,
    required this.quizzes,
  });

  QuizCategory copyWith({
    int? id,
    String? name,
    String? image,
    int? quizCount,
    DigitalStamp? digitalStamp,
    List<Quiz>? quizzes,
  }) {
    return QuizCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      quizCount: quizCount ?? this.quizCount,
      digitalStamp: digitalStamp ?? this.digitalStamp,
      quizzes: quizzes ?? this.quizzes,
    );
  }

  factory QuizCategory.fromJson(Map<String, dynamic> json) {
    final digitalStampJson = Map<String, dynamic>.from(json['digitalStamp']);

    return QuizCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      quizCount: json['quizCount'] as int,
      digitalStamp: DigitalStamp.fromJson(digitalStampJson),
      quizzes: (json['quizzes'] as List)
          .map((e) => Map<String, dynamic>.from(e))
          .map((quizJson) => Quiz.fromJson(quizJson))
          .toList(),
    );
  }
}
