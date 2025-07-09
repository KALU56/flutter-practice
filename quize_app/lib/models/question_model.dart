class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String category;

  Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.category,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      correctIndex: json['correctIndex'],
      category: json['category'],
    );
  }
}
