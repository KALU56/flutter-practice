import 'package:flutter/material.dart';
import 'question_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;

  List<Question> questions = [
    Question(
      questionText: "What is the capital of Ethiopia?",
      options: ["Addis Ababa", "Nairobi", "Cairo", "Accra"],
      correctIndex: 0,
    ),
    Question(
      questionText: "Which planet is known as the Red Planet?",
      options: ["Earth", "Mars", "Jupiter", "Saturn"],
      correctIndex: 1,
    ),
    // Add more questions here
  ];

  void checkAnswer(int selectedIndex) {
    if (answered) return;

    setState(() {
      answered = true;
      if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz Completed!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Your Score: $score / ${questions.length}',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      );
    }

    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              question.questionText,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              final isCorrect = index == question.correctIndex;
              final isSelected = answered && index == question.correctIndex;
              final isWrong = answered && index != question.correctIndex;

              Color buttonColor = Colors.blue;
              if (answered) {
                if (isCorrect) buttonColor = Colors.green;
                if (isWrong && index == currentQuestionIndex) {
                  buttonColor = Colors.red;
                }
              }

              return Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: answered
                        ? (index == question.correctIndex
                            ? Colors.green
                            : Colors.red)
                        : Colors.blue,
                  ),
                  onPressed: () => checkAnswer(index),
                  child: Text(question.options[index]),
                ),
              );
            }),
            SizedBox(height: 20),
            if (answered)
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
