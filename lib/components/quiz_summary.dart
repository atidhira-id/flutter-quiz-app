import 'package:flutter/material.dart';
import 'package:quiz_app/components/question_identifier.dart';
import 'package:quiz_app/components/summary_item.dart';
import 'package:quiz_app/models/question_summary.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(this.summaryData, {super.key});

  final List<QuestionSummary> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    QuestionIdentifier(
                      data.questionNumber + 1,
                      (data.correctAnswer == data.userAnswer),
                    ),
                    SizedBox(width: 20),
                    Expanded(child: SummaryItem(data)),
                    SizedBox(width: 20),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
