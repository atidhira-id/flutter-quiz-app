import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_summary.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final QuestionSummary data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data.question, style: TextStyle(color: Colors.white)),
        SizedBox(height: 5),
        Text(
          "Your answer: ${data.userAnswer}",
          style: TextStyle(color: const Color.fromARGB(255, 142, 149, 155)),
        ),
        Text(
          "Correct answer: ${data.correctAnswer}",
          style: TextStyle(color: const Color.fromARGB(255, 122, 183, 232)),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
