import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(int questionNumber, String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(int questionNumber, String answer) {
    widget.onSelectAnswer(questionNumber, answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...currentQuestion.getShuffledAnswer().map((answer) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(
                  answer,
                  onTap: () {
                    answerQuestion(currentQuestionIndex, answer);
                  },
                ),
                SizedBox(height: 8),
              ],
            );
          }),
        ],
      ),
    );
  }
}
