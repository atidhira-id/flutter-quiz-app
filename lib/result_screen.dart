import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question_summary.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.userAnswers,
    required this.handleRestart,
  });

  final List<String> userAnswers;
  final Function() handleRestart;

  List<QuestionSummary> getSummaryData() {
    final List<QuestionSummary> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add(
        QuestionSummary(
          questionNumber: i,
          question: questions[i].question,
          correctAnswer: questions[i].answers[0],
          userAnswer: userAnswers[i],
        ),
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final questionCount = questions.length;
    final correctAnswerCount =
        summaryData
            .where((element) => element.correctAnswer == element.userAnswer)
            .length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You answered $correctAnswerCount out of $questionCount questions correctly!',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 20),
          QuizSummary(summaryData),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: handleRestart,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.refresh),
            label: const Text('Retake Quiz!'),
          ),
        ],
      ),
    );
  }
}
