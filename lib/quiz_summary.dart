import 'package:flutter/material.dart';
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            data.correctAnswer == data.userAnswer
                                ? Colors.blue
                                : Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        (data.questionNumber + 1).toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.question,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Your answer: ${data.userAnswer}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 215, 131, 131),
                            ),
                          ),
                          Text(
                            "Correct answer: ${data.correctAnswer}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 122, 183, 232),
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
