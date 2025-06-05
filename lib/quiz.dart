import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Map<int, String> userAnswers = {};
  var activeScreen = 'start-screen';

  void startQuizScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void selectAnswer(int questionNumber, String answer) {
    userAnswers[questionNumber] = answer;

    if (userAnswers.length == questions.length) {
      setState(() {
        userAnswers = {};
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: selectAnswer);
    } else {
      screenWidget = StartScreen(handleStart: startQuizScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 40, 70),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
