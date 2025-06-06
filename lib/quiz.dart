import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> userAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen(String screenName) {
    setState(() {
      activeScreen = screenName;
    });
  }

  void selectAnswer(int questionNumber, String answer) {
    userAnswers.add(answer);

    if (userAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: selectAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        userAnswers: userAnswers,
        handleRestart: () {
          userAnswers = [];
          switchScreen('questions-screen');
        },
      );
    } else {
      screenWidget = StartScreen(
        handleStart: () {
          switchScreen('questions-screen');
        },
      );
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
