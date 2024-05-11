import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_answer_entity.dart';

class Quiz {
  final String question;
  final List<QuizAnswer> answers;

  Quiz({
    required this.question,
    required this.answers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json['question'],
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Map<String, dynamic>.from(e))
          .map((answerJson) => QuizAnswer.fromJson(answerJson))
          .toList(),
    );
  }
}
