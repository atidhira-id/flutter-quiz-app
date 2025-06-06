import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_summary.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(this.summaryData, {super.key});

  final List<QuestionSummary> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          summaryData.map((data) {
            return Row(
              children: [
                Text(
                  (data.questionNumber + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data.question,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data.userAnswer,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data.correctAnswer,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}
