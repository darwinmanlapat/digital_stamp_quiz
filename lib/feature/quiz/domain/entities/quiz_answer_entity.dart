class QuizAnswer {
  final String selection;
  final bool isCorrect;

  QuizAnswer({required this.selection, required this.isCorrect});

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(
      selection: json['selection'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }
}
